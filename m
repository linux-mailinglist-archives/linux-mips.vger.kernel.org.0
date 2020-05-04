Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E2B1C3246
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 07:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgEDFbm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 01:31:42 -0400
Received: from [115.28.160.31] ([115.28.160.31]:39344 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725859AbgEDFbm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 01:31:42 -0400
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 May 2020 01:31:41 EDT
Received: from [192.168.9.172] (unknown [140.207.23.182])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ABFD1600B4;
        Mon,  4 May 2020 13:25:00 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588569900; bh=O50RHHIgVEsTEEL5+9e+YuYaXRtUA2P6FLTNprIJCL8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iHpkAUU39ouhjr1/a0QPKO3/zzfKEWp2iAO8xHH8hNV583cL0SsOVKXnZOdcVfZeE
         Ui3fCB6LL/mlb3bXfepOjFQmsd34jJw8T1K5iHKg4fXZLsVfP0R2tCWJhxwrdZr+mD
         KBXYFiW8JpyQJ0yPxfxvhNMDp3dy0npUEtTvf3ME=
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
To:     jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200503103304.40678-5-git@xen0n.name>
 <20200503105012.43246-1-git@xen0n.name>
 <3B0FE747-AE18-404B-9CD3-D3401634340C@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <f8eb83b8-7ec3-5d5c-7f4c-c78f72c04c1a@xen0n.name>
Date:   Mon, 4 May 2020 13:25:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101
 Thunderbird/77.0a1
MIME-Version: 1.0
In-Reply-To: <3B0FE747-AE18-404B-9CD3-D3401634340C@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/3/20 11:50 PM, Jiaxun Yang wrote:

> Some random thoughts on that:
>
> While cpucfg instruction would not be available on other MIPS
> processors, and given that most distros are more willing to provide
> general MIPS version instead of Loongson specified version, we'd better
> provide user space programs a way to probe emulated/physical cpucfg support.
>
> Looks like elf_hwcap would be a option? I've already added some flags about
> Loongson's extension and now an extra HWCAP_LOONGSON_CPUCFG can cover everything.

All emulated outputs from the older models have the LCSRP bit clear in 
this patch. As CPUCFG is part of the Loongson CSR ASE, this is the 
reliable way to distinguish between emulated and physical CPUCFG support.

However, because detecting presence of CPUCFG itself still requires one 
to handle SIGILL, exposing an hwcap might be an option. So we'll have 
the following mapping:

- no HWCAP_LOONGSON_CPUCFG -- other MIPS or Loongson-2EF or Loongson-32
- CPUCFG.0x2.LCSRP == 0 -- older Loongson-64 models
- otherwise, Loongson-3A R4 or later

Seems some of the previously defined hwcaps will become unnecessary if 
we make this change. But they're already part of kernel ABI so we have 
to keep them, fortunately we still have plenty of bits available. At 
least future additions of Loongson features wouldn't go through hwcap.

I think the hwcap addition can be added in another follow-up series if 
the idea gets consensus; let's keep this series focused.

