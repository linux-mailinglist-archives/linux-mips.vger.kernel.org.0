Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543A524439C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 04:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgHNCxG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 22:53:06 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:52709 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgHNCxG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 22:53:06 -0400
Received: by mail-il1-f198.google.com with SMTP id q16so376197ils.19
        for <linux-mips@vger.kernel.org>; Thu, 13 Aug 2020 19:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HxfLWIdBAiPbucnwPKF3cZxaVC8QuNU2YTSLpVJCUKw=;
        b=G0Q5SsQIuRJBC15U00Qb4gpAjcPzr+wR85/WsN/jbIRjnNC3L6TUv8NCRsyF2QhX6B
         b8LVXI3NtxYPhfQJuLxSrsbER9GDHwAXnwMLedPj6dfz9aT6BzLSp6pv+GbDRnBOSoTT
         AsHCIpJlW59Mc06GNAC65ad0uqTPhnnNoWz+Pq8mk+xxJcdI0OVfPcXgDcqouWt92s4s
         EilVEemJ75IdN/g2XTBNiU9qeqDlKcRU/fgikiVKtJPoZSAOBr/ZmNbn5ybDliakKLX2
         BSMsuJSVS2p9fPtHhu9IYDIJSlfQ71mFRFsPZRCCTUKy90+/drzsITEtkGxxojdk7aMu
         wH9g==
X-Gm-Message-State: AOAM533HJAE+z34pJOQiDmhkP2316rjeH2B+9ZkDbdbPtOcqijVrMyYO
        PbqVMvERZvSwKXrQ3M/n2dlmmxuGfFI0OzcTKKTam4ipgtMT
X-Google-Smtp-Source: ABdhPJzryMeKOZ496e+GJ+LGFENqZB41wF2qyZpZxNTovBIXHQqXhdpw9rzntoAMQSMpzfINa/YRJDaIms05Hc/ZO6OshxSkwVFv
MIME-Version: 1.0
X-Received: by 2002:a92:dd04:: with SMTP id n4mr789973ilm.70.1597373585198;
 Thu, 13 Aug 2020 19:53:05 -0700 (PDT)
Date:   Thu, 13 Aug 2020 19:53:05 -0700
In-Reply-To: <000000000000735f5205a5b02279@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e967a05accd8573@google.com>
Subject: Re: BUG: unable to handle kernel paging request in fl_dump_key
From:   syzbot <syzbot+9c1be56e9317b795e874@syzkaller.appspotmail.com>
To:     benh@kernel.crashing.org, dalias@libc.org, davem@davemloft.net,
        jhogan@kernel.org, jhs@mojatatu.com, jiri@mellanox.com,
        jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, netdev@vger.kernel.org, paul.burton@mips.com,
        paulus@samba.org, ralf@linux-mips.org, shuah@kernel.org,
        syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com,
        ysato@users.sourceforge.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

syzbot has bisected this issue to:

commit a51486266c3ba8e035a47fa96df67f274fe0c7d0
Author: Jiri Pirko <jiri@mellanox.com>
Date:   Sat Jun 15 09:03:49 2019 +0000

    net: sched: remove NET_CLS_IND config option

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17463509900000
start commit:   1ca0fafd tcp: md5: allow changing MD5 keys in all socket s..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c63509900000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c63509900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf3aec367b9ab569
dashboard link: https://syzkaller.appspot.com/bug?extid=9c1be56e9317b795e874
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1062a40b100000

Reported-by: syzbot+9c1be56e9317b795e874@syzkaller.appspotmail.com
Fixes: a51486266c3b ("net: sched: remove NET_CLS_IND config option")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
