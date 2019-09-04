Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF65FA77FD
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 03:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfIDBFC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 21:05:02 -0400
Received: from forward103j.mail.yandex.net ([5.45.198.246]:46471 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726589AbfIDBFB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 21:05:01 -0400
Received: from mxback2j.mail.yandex.net (mxback2j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10b])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id E511567401AA;
        Wed,  4 Sep 2019 04:04:57 +0300 (MSK)
Received: from smtp4p.mail.yandex.net (smtp4p.mail.yandex.net [2a02:6b8:0:1402::15:6])
        by mxback2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id iM9c7mkalx-4vNuEoEX;
        Wed, 04 Sep 2019 04:04:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567559097;
        bh=bbtBHr5oY2eX7Wq/nNBFqwhRQ7lHiT4aj3By06XAaqM=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=vMGCEyf1rkBjCgcBHsbbpS4qpfpxa/+f6TZwQjVyoAuFUyU4q/KlzUXpruOtrz1gO
         7ws9XETp2UHc4ilruaeLYJZKOIEZV1NY+WAYD80UYPNZFFxeu1shJB0DasRZq4jdwE
         qMTIZPOXJcTpNSjQCSl8Wd7hLGkrySMI9GetvsHE=
Authentication-Results: mxback2j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id A1hb0npBaY-4hbKk3fj;
        Wed, 04 Sep 2019 04:04:47 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 022/120] MIPS: R5900: Support 64-bit inq() and outq()
 macros in 32-bit kernels
To:     Fredrik Noring <noring@nocrew.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?UTF-8?Q?J=c3=bcrgen_Urban?= <JuergenUrban@gmx.de>
References: <cover.1567326213.git.noring@nocrew.org>
 <7ea8b1211bceb8193154b51ad4241e7c0b86547d.1567326213.git.noring@nocrew.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <975d5c12-2918-80e7-3ab5-93c678e1a2e0@flygoat.com>
Date:   Wed, 4 Sep 2019 09:04:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <7ea8b1211bceb8193154b51ad4241e7c0b86547d.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2019/9/1 23:46, Fredrik Noring 写道:
> PlayStation 2 hardware such as the Graphics Synthesizer requires 64-bit
> register reads and writes[1], also in 32-bit kernels. Interrupts must be
> disabled when manipulating 64-bit registers unless the kernel saves and
> restores 64-bit registers in the interrupt and context switch handlers.

Hi Fredrik,

Why don't we just build a 64bit kernel rather than do these hacks?

Any hardware/firmware issue blocks 64bit kernel?

--

Jiaxun Yang

> References:
>
> [1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
>      p. 26: GS privileged registers must be accessed using LD/SD
>      instructions.
>
> Signed-off-by: Fredrik Noring<noring@nocrew.org>
> ---
