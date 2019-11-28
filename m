Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A663110CB62
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 16:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfK1PKQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 10:10:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:36592 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfK1PKQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 10:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574953811;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9HDndJJD7hakBPLX0vyn4IoWO7QTa8T6y1yozlEq+hI=;
        b=DXZ5O83KDuy25z+CSfoYmxWGuDbEgWgevpM4YohJjfNoRwuJU9bbN7INu3rNpZlrjv
        +c42m5SZoFVJ37dzvHpH1ns39Je8n7ZF+ZsC8HOZzqCG6oaJzttVndDVXk5ZW1Fh9kKy
        l8tbLQmuxL7KXduufqyOXYlqgKTMYcKoj1c24vMAAzXHed0AiCcDfiXlgpsRys8I7Zk9
        elG1EIQ/qlVpiR1SI63lRa/RhZQQoWeRmIlhPbeHCzd1CgA6uOLU7Fm2KRjKx20PeXtX
        4EWvMW4kq5E5NYks540B7Afqv1Ova7kgSNHTZYJawDY3opBc97VTE0bipcQ+TySHPg4X
        MYyg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASFA1KfB
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 16:10:01 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <091536b5-6c77-eed4-eec1-82b331332a74@arm.com>
Date:   Thu, 28 Nov 2019 16:10:00 +0100
Cc:     linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3F683EF-FB6E-43FD-A732-4096BCB9433C@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com> <3190d1a4-96c4-1843-3ae1-bae3a97af9fb@arm.com> <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com> <3E2EEC19-F320-4320-9A85-67B4E615C74A@goldelico.com> <96b53936-a288-91bc-a14b-a501c5231a03@arm.com> <2966D06E-C754-4807-A48E-02D476EF1A24@goldelico.com> <091536b5-6c77-eed4-eec1-82b331332a74@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 15:04 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> On 28/11/2019 12:16, H. Nikolaus Schaller wrote:
>> Ah, good question. How do I find out? Checking defconfig did not show =
any
>> config with R4K or GIC. So it is likely NONE. CONFIG_RTC_DRV_JZ4740=3Dy=
 if that
>> helps.
>=20
> Try to check what do you have in /sys/devices/system/clocksource.

Ok, have finished another project and could check:

root@letux:~# ls -l /sys/devices/system/clocksource/clocksource0/        =
           =20
total 0
-r--r--r-- 1 root root 4096 Nov  3 17:18 available_clocksource
-rw-r--r-- 1 root root 4096 Nov  3 17:18 current_clocksource
drwxr-xr-x 2 root root    0 Nov  3 17:18 power
lrwxrwxrwx 1 root root    0 Nov  3 17:16 subsystem -> =
../../../../bus/clocksource
-rw-r--r-- 1 root root 4096 Nov  3 17:16 uevent
--w------- 1 root root 4096 Nov  3 17:18 unbind_clocksource
root@letux:~# cat /sys/devices/system/clocksource/clocksource0/*
ingenic-timer=20
ingenic-timer
cat: /sys/devices/system/clocksource/clocksource0/power: Is a directory
cat: /sys/devices/system/clocksource/clocksource0/subsystem: Is a =
directory
cat: /sys/devices/system/clocksource/clocksource0/unbind_clocksource: =
Permission denied
root@letux:~#

Does that help?

BR,
Nikolaus

