#!/usr/bin/expect

set timeout 50
spawn ssh user@hostname
    interact {
    timeout 30 {send "\x20\x7f"}
    }
