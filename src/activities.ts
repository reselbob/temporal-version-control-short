import {ApplicationFailure} from "@temporalio/workflow";
import path from "path";
import fs from "fs";

const dataFileSpec = path.join(__dirname, '../data', 'data.json')
export async function getArticle(): Promise<string>  {
    const data = fs.readFileSync(dataFileSpec,
        {encoding:'utf8', flag:'r'});
    const articles = JSON.parse(data).articles;
    const randomIndex = Math.floor(Math.random() * articles.length);
    const randomEntry = articles[randomIndex];
    return randomEntry;
}

export async function getEditor(): Promise<string>  {
    const forbiddenNames: string[] = ["Elmer Fudd", "Fred Flintstone"];
    const data = fs.readFileSync(dataFileSpec,
        {encoding:'utf8', flag:'r'});
    const names = JSON.parse(data).editors;
    const goodEditors: string[] = names.filter((name: string) => !forbiddenNames.includes(name));
    return goodEditors[Math.floor(Math.random() * goodEditors.length)];
}

export async function proofread(editor: string, article:string): Promise<string> {
    const msg = `${editor} is proofreading: ${article}.`;

    const arr : string[] = [];
    arr.push(msg);
    arr.push(await checkSpelling(editor, article));
    arr.push(await checkGrammar(editor, article));
    const json = JSON.stringify(arr,null, 2);
    console.log(json);
    return json;
}

export async function copyEdit(editor: string, article:string): Promise<string> {
    const arr : string[] = [];
    arr.push(`${editor} is copy editing: ${article}.`);
    arr.push(await checkStyle(editor,article));
    return JSON.stringify(arr, null, 2);
}


export async function formatEdit(editor: string, article:string): Promise<string> {
    const msg = `${editor} is format editing: ${article}.`;
    console.log(msg);
    return msg;
}

export async function techEdit(editor: string, article:string): Promise<string> {
    const msg = `${editor} is tech editing: ${article}.`;
    console.log(msg);
    return msg;
}

export async function checkSpelling(editor: string, article:string): Promise<string> {
    const msg = `${editor} is spell checking: ${article}.`;
    return msg;
}

export async function checkGrammar(editor: string, article:string): Promise<string> {
    const msg = `${editor} is grammar checking: ${article}.`;
    return msg;
}

export async function checkStyle(editor: string, article:string): Promise<string> {
    const msg = `${editor} is style checking: ${article}.`;
    return msg;
}



