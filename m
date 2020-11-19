Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51472B8ED2
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 10:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgKSJ3Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 04:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgKSJ3Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 04:29:24 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Nov 2020 01:29:24 PST
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701C0C0617A7
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2020 01:29:24 -0800 (PST)
Received: (qmail 21243 invoked from network); 19 Nov 2020 09:21:15 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57158 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <alex_y_xu@yahoo.ca>; Thu, 19 Nov 2020 10:21:15 +0100
MIME-Version: 1.0
Date:   Thu, 19 Nov 2020 10:21:12 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, torvalds@linux-foundation.org
Subject: Re: [RFC PATCH] treewide: remove bzip2 compression support
In-Reply-To: <20201117223253.65920-1-alex_y_xu@yahoo.ca>
References: <20201117223253.65920-1-alex_y_xu.ref@yahoo.ca>
 <20201117223253.65920-1-alex_y_xu@yahoo.ca>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <a9a7fc22ea6fb6bdeb3274fe05a7f0d9@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 2020-11-17 23:32, schrieb Alex Xu (Hello71):
> bzip2 is either slower or larger than every other supported algorithm,
> according to benchmarks at [0]. It is far slower to decompress than any
> other algorithm, and still larger than lzma, xz, and zstd.

> 
> diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
> index abb9fc164657..b74d14caabe6 100644
> --- a/Documentation/x86/boot.rst
> +++ b/Documentation/x86/boot.rst
> @@ -781,10 +781,10 @@ Protocol:	2.08+
>    The payload may be compressed. The format of both the compressed and
>    uncompressed data should be determined using the standard magic
>    numbers.  The currently supported compression formats are gzip
> -  (magic numbers 1F 8B or 1F 9E), bzip2 (magic number 42 5A), LZMA
> -  (magic number 5D 00), XZ (magic number FD 37), LZ4 (magic number
> -  02 21) and ZSTD (magic number 28 B5). The uncompressed payload is
> -  currently always ELF (magic number 7F 45 4C 46).
> +  (magic numbers 1F 8B or 1F 9E), LZMA (magic number 5D 00), XZ (magic
> +  number FD 37), LZ4 (magic number 02 21) and ZSTD (magic number 28
> +  B5). The uncompressed payload is currently always ELF (magic number
> +  7F 45 4C 46).
> 
>  ============	==============
>  Field name:	payload_length
> diff --git a/arch/arm/configs/aspeed_g4_defconfig
> b/arch/arm/configs/aspeed_g4_defconfig
> index 58d293b63581..f2f5dcd0e59c 100644

I would keep the magic number, and just tell that it is not supported by 
newer kernels anymore if at all. It's just handy to be able to look into 
the most recent documentation and see what the values are for. If you 
look at an older image and don't find the magic number my first impulse 
would not be to look at older versions of the documentation for things 
that were removed.

Maybe something like:

"Formerly supported was also bzip2 (magic number 42 5A)."

Eike
