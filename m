Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ADA330BD7
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 11:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhCHK4W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 05:56:22 -0500
Received: from elvis.franken.de ([193.175.24.41]:57497 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230519AbhCHK4E (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 05:56:04 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJDYR-0003M5-02; Mon, 08 Mar 2021 11:56:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 99DEFC12B6; Mon,  8 Mar 2021 11:55:50 +0100 (CET)
Date:   Mon, 8 Mar 2021 11:55:50 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes
Message-ID: <20210308105550.GC6622@alpha.franken.de>
References: <20210307182301.20710-1-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210307182301.20710-1-bjorn@mork.no>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 07:23:01PM +0100, Bjørn Mork wrote:
> The devicetree specification requires 8-byte alignment in
> memory. This is now enforced by libfdt since commit 79edff12060f
> ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
> which included the upstream commit 5e735860c478 ("libfdt: Check for
> 8-byte address alignment in fdt_ro_probe_()").
> 
> This broke the MIPS raw appended DTBs which would be appended to
> the image immediately following the initramfs section.  This ends
> with a 32bit size, resulting in a 4-byte alignment of the DTB.
> 
> Fix by padding with zeroes to 8-bytes when MIPS_RAW_APPENDED_DTB
> is defined.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Bjørn Mork <bjorn@mork.no>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 5 +++++
>  1 file changed, 5 insertions(+)

thank you for your patch, but there already was a fix for the problem
pending from Paul, which I've applied to mips-fixes a few minutes ago.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
