Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E877410C9CF
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfK1Ns5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 08:48:57 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:33431 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1Ns4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 08:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574948934;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/wIFaKm+ebxmf1zDi6heRwAyFXGyk1wVGBocTvOmgvg=;
        b=KWmWJv+UuVCytxbtt7bbmW7qKStQeCk4zD7XVhLzCqDb3hwTytpgEmQyNi2Q9zUqLx
        aHYNgAfouQOGcYDbM3WDIT/BO5VzcvBfQ9oV2J3gRhjkCpZzaeASLetkzld7DTLdVnU3
        VlOqYjSnt84aH5xLZ9eQulQeV3fXY1NmG44oZChAY9smnzj/5Zf5Zox4luS2SOKgOtp4
        q9+732esAeoKqI2PEfQxcwnT0s2ArjODDqUwfAKRHxA07QTG+rteBEhkKinxTHj3lFO3
        FcHKfXX8r9TVijF2Tklh1au0VHoan7ujIrWOTO1LNu50DsYR8pN/Y1TsIUzh6t97yFyk
        5BPg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASDmkKBI
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 14:48:46 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4807842.gtHLO0kk0V@hyperion>
Date:   Thu, 28 Nov 2019 14:48:46 +0100
Cc:     mips-creator-ci20-dev@googlegroups.com,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com> <4807842.gtHLO0kk0V@hyperion>
To:     Maarten ter Huurne <maarten@treewalker.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 14:29 schrieb Maarten ter Huurne <maarten@treewalker.org>:
> 
> On Thursday, 28 November 2019 13:33:17 CET H. Nikolaus Schaller wrote:
>> Hi Vincenzo,
>> 
>>> Am 28.11.2019 um 13:21 schrieb Vincenzo Frascino
>>> <vincenzo.frascino@arm.com>:> 
>>> [...]
>>> The the lib that provides the gettimeofday() changes accordingly
>>> with vdso_data. 5.4 and 4.19 have 2 different vdso libraries as
>>> well.
>> 
>> Yes, that is what I have assumed what happens. How do these libs go
>> into an existing and working root-file-system with Debian Stretch?
> 
> I'm a novice when it comes to vDSO, so someone please correct me if I'm 
> wrong.
> 
> From what I read vDSO is a library in the sense that it exports ELF 
> symbols that applications and other libraries (libc in particular) can 
> use, but it is not a file on disk.

Ah, ok. This would mean that the libc providing the gettimeofday()
should be able to find out a modified changed vdso_data format by
inspecting these ELF symbols.

> 
> As such, which rootfs you use shouldn't matter, since the vDSO is not in 
> the rootfs. Instead, it is contained in the kernel image. Searching for 
> "linux-vdso.so.1" on packages.debian.org indeed returns no hits.
> 
> There is a check in arch/mips/vdso/Makefile that disables vDSO on MIPS 
> when building the kernel with binutils < 2.25. I don't know if that is 
> in any way related to this issue.

What still does not fit into the picture is the errno = 1 i.e. EPERM.
Maybe I have to study the libc code that tries to read the ELF symbols
you have mentioned. It may fail for unknown reasons.

BR and thanks,
Nikolaus
