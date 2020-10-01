Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DCB280844
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 22:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgJAUPw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Oct 2020 16:15:52 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:50543 "EHLO
        out28-170.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgJAUPw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Oct 2020 16:15:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07441881|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00357957-4.83066e-05-0.996372;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.Ieb2i4B_1601583346;
Received: from 192.168.10.195(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ieb2i4B_1601583346)
          by smtp.aliyun-inc.com(10.147.41.137);
          Fri, 02 Oct 2020 04:15:47 +0800
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Kernel 5.9-rc regression.
Message-ID: <25b6a64b-b5ac-c85a-abde-909fb2d768f9@wanyeetech.com>
Date:   Fri, 2 Oct 2020 04:15:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas and list,

There is a strange phenomenon in kernel 5.9-rc: when using kernel 5.9-rc 
with debian 10 and running htop, the memory footprint will be displayed 
as 3.99T. When the actual memory footprint increases, the displayed 
value will be reduced to 3.98T, 3.97T etc. These phenomena have been 
confirmed in X1000, X1830, and JZ4780 (disable SMP), this phenomenon 
does not seem to affect the SMP processor. When the JZ4780 turn on SMP, 
the memory footprint will be displayed normally.


The following is the relevant log:

   CPU[*                         0.7%]   Tasks: 18, 4 thr; 1 running
   Mem[###*****************3.99T/120M]   Load average: 0.02 0.02 0.00
   Swp[                       0K/768M]   Uptime: 00:02:07

   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+ Command
  1135 cu-neo     20   0  8872  3152  2724 R  1.3  2.6  0:00.06 htop
     1 root       20   0 16268  7940  6588 S  0.0  6.5  0:02.06 /sbin/init
   512 root       20   0 23932  6188  5408 S  0.0  5.0  0:00.30 
/lib/systemd/syst
   746 root       20   0 17124  3492  2956 S  0.0  2.8  0:00.17 
/lib/systemd/syst
   770 systemd-t  20   0 23524  5700  5040 S  0.0  4.6  0:00.02 
/lib/systemd/syst
   756 systemd-t  20   0 23524  5700  5040 S  0.0  4.6  0:00.22 
/lib/systemd/syst
   772 root       20   0  8832  2436  2252 S  0.0  2.0  0:00.01 
/usr/sbin/cron -f
   773 root       20   0 14224  5812  5152 S  0.0  4.7  0:00.14 
/lib/systemd/syst
   774 messagebu  20   0  7392  4056  3628 S  0.0  3.3  0:00.20 
/usr/bin/dbus-dae
   775 root       20   0 12256  5096  4644 S  0.0  4.2  0:00.06 
/sbin/wpa_supplic
   793 root       20   0 25152  3844  3112 S  0.0  3.1  0:00.01 
/usr/sbin/rsyslog
   794 root       20   0 25152  3844  3112 S  0.0  3.1  0:00.00 
/usr/sbin/rsyslog
   795 root       20   0 25152  3844  3112 S  0.0  3.1  0:00.02 
/usr/sbin/rsyslog
   776 root       20   0 25152  3844  3112 S  0.0  3.1  0:00.06 
/usr/sbin/rsyslog
   821 root       20   0  8576  5492  4632 S  0.0  4.5  0:00.03 
/sbin/dhclient -4
   868 root       20   0  4524  1856  1748 S  0.0  1.5  0:00.01 
/sbin/agetty -o -
   871 root       20   0 11524  3820  3348 S  0.0  3.1  0:00.17 
/bin/login -p --
F1Help  F2Setup F3SearchF4FilterF5Tree  F6SortByF7Nice -F8Nice +F9Kill  
F10Quit

