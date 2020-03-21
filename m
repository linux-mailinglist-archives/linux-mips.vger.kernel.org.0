Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2402B18DF55
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 11:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbgCUKGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Mar 2020 06:06:05 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:45614 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgCUKGE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Mar 2020 06:06:04 -0400
Received: by mail-il1-f197.google.com with SMTP id p15so3385713ils.12
        for <linux-mips@vger.kernel.org>; Sat, 21 Mar 2020 03:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=csp/uWkMe2b+8oGOYW5kiZNzSSclUYEAacoZv0rCvqk=;
        b=Z27cdiFNqdRBAv5u8ynJmT3Ha0hfGw3K++ORRfTRFVubE7d0rvkVxI2tmxNdW9KUJB
         ktab/TDVdoNrG6Xs31VVG3PYW87BOAkxZ0ssVmKd8r7t5M30yb4x0lbDBDCJ6LwxQTVr
         ZmidaBOKZRTw+yNL35vs8Zg/iCV4IP+f0LqnWSYb3yGIU8EW1cuqvIRJ2Ab+XZ+zuw+o
         XVzV1AYEILgEOYp+DJ+X8+Ov1UEB3wmBt4KQaxrK+T01RpK7UVeN0XMIgOGWWklEfm+i
         eqenzDZRs38k0dBeeIhAbaGPQVyJRCes5IlmXNjSM7Ol4ML77yv/X99IueYMS8IJ9r7p
         3H1A==
X-Gm-Message-State: ANhLgQ3U324TdL0ArZjK15Fyq0o7LcP9CmZ8aC1vtPb4kk+kc3LwIZzM
        K4bahW/XaTbVsQ95CdbiUd8CcmS0W36Fb6bjkaqUVfQcUuzN
X-Google-Smtp-Source: ADFU+vsaIcmncK18+Ieo+gah2r3Mc4dVZcKt+uM5AQLPMRYyESC2bTTap13veK7eeW59XEnlnqXdZvgx89YWLxqY8cNDymFdn/ek
MIME-Version: 1.0
X-Received: by 2002:a92:778e:: with SMTP id s136mr12758239ilc.256.1584785163067;
 Sat, 21 Mar 2020 03:06:03 -0700 (PDT)
Date:   Sat, 21 Mar 2020 03:06:03 -0700
In-Reply-To: <000000000000e9ca5105a08797f2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b0a7eb05a15a8ce7@google.com>
Subject: Re: WARNING: refcount bug in sk_alloc (2)
From:   syzbot <syzbot+b1212b1215db82ff9211@syzkaller.appspotmail.com>
To:     alexios.zavras@intel.com, allison@lohutok.net, andriin@fb.com,
        ap420073@gmail.com, ast@kernel.org, bpf@vger.kernel.org,
        daniel@iogearbox.net, davem@davemloft.net, ebiederm@xmission.com,
        gregkh@linuxfoundation.org, jhogan@kernel.org, kafai@fb.com,
        keescook@chromium.org, kuba@kernel.org, kuznet@ms2.inr.ac.ru,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lirongqing@baidu.com, mojha@codeaurora.org, netdev@vger.kernel.org,
        paulburton@kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
        ptalbert@redhat.com, ralf@linux-mips.org, rppt@linux.ibm.com,
        songliubraving@fb.com, swinslow@gmail.com,
        syzkaller-bugs@googlegroups.com, tbogendoerfer@suse.de,
        tglx@linutronix.de, yhs@fb.com, yoshfuji@linux-ipv6.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

syzbot has bisected this bug to:

commit b78e9d63a3b6307b6b786e6ba189d3978b60ceb5
Author: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Date:   Thu Jan 9 12:33:40 2020 +0000

    MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17330a23e00000
start commit:   0d1c3530 net_sched: keep alloc_hash updated after hash all..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14b30a23e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=10b30a23e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c2e311dba9a02ba9
dashboard link: https://syzkaller.appspot.com/bug?extid=b1212b1215db82ff9211
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e76a39e00000

Reported-by: syzbot+b1212b1215db82ff9211@syzkaller.appspotmail.com
Fixes: b78e9d63a3b6 ("MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
