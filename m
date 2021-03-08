Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A566D330BFB
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 12:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCHLKv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 06:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhCHLKn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 06:10:43 -0500
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C2AC06174A
        for <linux-mips@vger.kernel.org>; Mon,  8 Mar 2021 03:10:42 -0800 (PST)
Received: from miraculix.mork.no (fwa153.mork.no [192.168.9.153])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 128BAYh6018464
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 8 Mar 2021 12:10:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1615201834; bh=689L3JKNqOUIsIrRHrcaTEZUQgbyPCD/kQoUu3R6eaY=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=T74VkGLi32UMnG+kTxgkrT9uGg4LDSW60iW1z9xUfiJgjBuCfM1bU/idOMz8hAvxS
         XANAFv+HWHbx1RXxSVcUgMMXtjfXvXwgPCMdYkbKb5F+9YpeF7hx083WxlhEb1ul9u
         5q90znWeYhQ9gE2mcyCQ7Bca0FTFxgCw+W+MQNzM=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1lJDmT-000DPo-PE; Mon, 08 Mar 2021 12:10:33 +0100
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes
Organization: m
References: <20210307182301.20710-1-bjorn@mork.no>
        <20210308105550.GC6622@alpha.franken.de>
Date:   Mon, 08 Mar 2021 12:10:33 +0100
In-Reply-To: <20210308105550.GC6622@alpha.franken.de> (Thomas Bogendoerfer's
        message of "Mon, 8 Mar 2021 11:55:50 +0100")
Message-ID: <87h7llc34m.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:

> On Sun, Mar 07, 2021 at 07:23:01PM +0100, Bj=C3=B8rn Mork wrote:
>> The devicetree specification requires 8-byte alignment in
>> memory. This is now enforced by libfdt since commit 79edff12060f
>> ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
>> which included the upstream commit 5e735860c478 ("libfdt: Check for
>> 8-byte address alignment in fdt_ro_probe_()").
>>=20
>> This broke the MIPS raw appended DTBs which would be appended to
>> the image immediately following the initramfs section.  This ends
>> with a 32bit size, resulting in a 4-byte alignment of the DTB.
>>=20
>> Fix by padding with zeroes to 8-bytes when MIPS_RAW_APPENDED_DTB
>> is defined.
>>=20
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
>> ---
>>  arch/mips/kernel/vmlinux.lds.S | 5 +++++
>>  1 file changed, 5 insertions(+)
>
> thank you for your patch, but there already was a fix for the problem
> pending from Paul, which I've applied to mips-fixes a few minutes ago.

Yes, I see.  That does look much nicer.  But I don't think it addresses
the problem with an uncompressed kernel?  Could we have the padding in
vmlinux.lds.S  as well?  Or some other solution to ensure that it is
possible to cat the DTB to the end of vmlinux.bin without manually
aligning it to 8 bytes?


Bj=C3=B8rn
