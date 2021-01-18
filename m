Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595332F976B
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 02:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbhARBuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 20:50:51 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:33563 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730805AbhARBut (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 Jan 2021 20:50:49 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 8594F1351;
        Sun, 17 Jan 2021 20:49:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 17 Jan 2021 20:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=7
        RcYBARVDjiLyUTd8rrfT51xppd23mBdgNXI4qljLbc=; b=klZCGFFeIc6YHjTZm
        i1Zl5ajSAxpPKWpch79VhopNWGSJ3ujaJpIVrSNuB+0hn0ZNVYbFho4X6AARG0tz
        zgUmBT5jaqxBt4k/Ei0e+Blel46qAOhj8YcH2TXONrPrzWIkLxgX75tFbLK/zfoz
        vKJvgT/gyPOkTMcBdZnAAgciT0wqZQ2095Emv11gknXewJDLqSikVlQvAPmVdClq
        6DlYXR3aeV81X+S0Zp2xky3fJkQ71l22ErmrJZuJRxO0/ceDaQBsniMWjOAksP3X
        j7Ea669TZ0h5OpyJ7xE0E4Gy39tPUJluMxfliqwMSuXVoTV+Rt/Oya4+oCrOE76G
        5sBTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=7RcYBARVDjiLyUTd8rrfT51xppd23mBdgNXI4qljL
        bc=; b=dh0fMXnuTia6zID6FJSOw17g7OiBJHvYZHVyLS4ktQoVmcdU30s4liFEq
        H9VO7ZF7ydEQ5bw4qrbVLOB4qYZqWcbrE79y0agylrsreqcLc0CrBAgv8zkLFfDn
        d3rRHwhUcdy0aCqTWVguSZgfDSqdzxi0awCaQmASFTeWV1BT8miP+HbVhrq4GmSt
        O+Xw70qchykIAix4ZgN2jd+caGsSWX7jkXkjZ5Tiidh3nOqufZjkVhpIEUPE9FBo
        XCzvZPcJtKOKPq5zxmA78tWXwrHOaLWk9qoM+AefBoekWp0ZuPAZ8UB2T8ce9e0L
        0hXRhdtg15XiYhLR/DO4yOxwTMoXg==
X-ME-Sender: <xms:NOkEYGVCLb0MUvjvY4HzQHNYTwy5GzZRoap-ccnuauN0ZdrHKzjX2A>
    <xme:NOkEYNIQ8m4f6vWEqlFwfoYi06Ya95v-xc8UjK2G5_LlEWj2wNorzbnxUg54pq8qa
    WTjQRM9YoD7f3CeCTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:NOkEYG_j5S7KlxmTRpgNZMCkKGtVPuFyrJEQOJ_yU6CCvEnkp1r58Q>
    <xmx:NOkEYALGzBvOQH8PNVjYb-vFh76Veqp5vYoG4ykoyPNinybr0pTiBQ>
    <xmx:NOkEYLlohGQq4Fe2WMWDetb-ZSmsPkDEVbBVIRF2WEpjBK6WYuPO4A>
    <xmx:NekEYLElVi3BNln-cYcVxw5ofk2n-wGDbf4ef0Cug2bFNks7JI2RjZtw9zs>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2C7631080057;
        Sun, 17 Jan 2021 20:49:34 -0500 (EST)
Subject: Re: [PATCH mips-next 1/2] MIPS: module: optimize module relocations
 processing
To:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210116150126.20693-1-alobakin@pm.me>
 <20210116150225.21127-1-alobakin@pm.me>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <fdf9c1a8-f5a7-3fae-1743-fa95fe41be42@flygoat.com>
Date:   Mon, 18 Jan 2021 09:49:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116150225.21127-1-alobakin@pm.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/1/16 下午11:02, Alexander Lobakin 写道:
> For now, module relocation functions are implemented as an array
> of handlers of type reloc_handler_t.
>
> Convert that array into a single switch-case function to:
>   - remove unused arguments;
>   - change the return type of simple handlers to void;
>   - remove the array and don't use any data at all;
>   - avoid using indirect calls;
>   - allow the compiler to inline and greatly optimize
>     the relocation function[s].
>
> The result on MIPS32 R2 with GCC 10.2 -O2 is:
>
> scripts/bloat-o-meter -c arch/mips/kernel/__module.o arch/mips/kernel/module.o
> add/remove: 1/11 grow/shrink: 1/0 up/down: 876/-1436 (-560)
> Function                                     old     new   delta
> apply_relocate                               456    1148    +692
> apply_r_mips_pc                                -     184    +184
> apply_r_mips_none                              8       -      -8
> apply_r_mips_32                               16       -     -16
> apply_r_mips_64                               76       -     -76
> apply_r_mips_highest                          88       -     -88
> apply_r_mips_higher                          108       -    -108
> apply_r_mips_26                              132       -    -132
> apply_r_mips_pc26                            160       -    -160
> apply_r_mips_pc21                            160       -    -160
> apply_r_mips_pc16                            160       -    -160
> apply_r_mips_hi16                            172       -    -172
> apply_r_mips_lo16                            356       -    -356
> Total: Before=2608, After=2048, chg -21.47%
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Data                                         old     new   delta
> Total: Before=12, After=12, chg +0.00%
> add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-248 (-248)
> RO Data                                      old     new   delta
> reloc_handlers                               248       -    -248
> Total: Before=248, After=0, chg -100.00%
>
> All functions were collapsed into a single one that is called
> directly by $(srctree)/kernel/module.c.
>
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   arch/mips/kernel/module.c | 109 ++++++++++++++++++--------------------
>   1 file changed, 52 insertions(+), 57 deletions(-)
>
> diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
> index 3c0c3d1260c1..14f46d17500a 100644
> --- a/arch/mips/kernel/module.c
> +++ b/arch/mips/kernel/module.c
> @@ -40,22 +40,13 @@ void *module_alloc(unsigned long size)
>   }
>   #endif
>   
> -static int apply_r_mips_none(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela)
> -{
> -	return 0;
> -}
> -
> -static int apply_r_mips_32(struct module *me, u32 *location,
> -			   u32 base, Elf_Addr v, bool rela)
> +static void apply_r_mips_32(u32 *location, u32 base, Elf_Addr v)
>   {
>   	*location = base + v;
> -
> -	return 0;
>   }
>   
> -static int apply_r_mips_26(struct module *me, u32 *location,
> -			   u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_26(struct module *me, u32 *location, u32 base,
> +			   Elf_Addr v)
>   {
>   	if (v % 4) {
>   		pr_err("module %s: dangerous R_MIPS_26 relocation\n",
> @@ -75,8 +66,8 @@ static int apply_r_mips_26(struct module *me, u32 *location,
>   	return 0;
>   }
>   
> -static int apply_r_mips_hi16(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_hi16(struct module *me, u32 *location, Elf_Addr v,
> +			     bool rela)
>   {
>   	struct mips_hi16 *n;
>   
> @@ -217,26 +208,25 @@ static int apply_r_mips_pc(struct module *me, u32 *location, u32 base,
>   	return 0;
>   }
>   
> -static int apply_r_mips_pc16(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_pc16(struct module *me, u32 *location, u32 base,
> +			     Elf_Addr v)
>   {
>   	return apply_r_mips_pc(me, location, base, v, 16);
>   }
>   
> -static int apply_r_mips_pc21(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_pc21(struct module *me, u32 *location, u32 base,
> +			     Elf_Addr v)
>   {
>   	return apply_r_mips_pc(me, location, base, v, 21);
>   }
>   
> -static int apply_r_mips_pc26(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_pc26(struct module *me, u32 *location, u32 base,
> +			     Elf_Addr v)
>   {
>   	return apply_r_mips_pc(me, location, base, v, 26);
>   }
>   
> -static int apply_r_mips_64(struct module *me, u32 *location,
> -			   u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_64(u32 *location, Elf_Addr v, bool rela)
>   {
>   	if (WARN_ON(!rela))
>   		return -EINVAL;
> @@ -246,8 +236,7 @@ static int apply_r_mips_64(struct module *me, u32 *location,
>   	return 0;
>   }
>   
> -static int apply_r_mips_higher(struct module *me, u32 *location,
> -			       u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_higher(u32 *location, Elf_Addr v, bool rela)
>   {
>   	if (WARN_ON(!rela))
>   		return -EINVAL;
> @@ -258,8 +247,7 @@ static int apply_r_mips_higher(struct module *me, u32 *location,
>   	return 0;
>   }
>   
> -static int apply_r_mips_highest(struct module *me, u32 *location,
> -				u32 base, Elf_Addr v, bool rela)
> +static int apply_r_mips_highest(u32 *location, Elf_Addr v, bool rela)
>   {
>   	if (WARN_ON(!rela))
>   		return -EINVAL;
> @@ -272,12 +260,14 @@ static int apply_r_mips_highest(struct module *me, u32 *location,
>   
>   /**
>    * reloc_handler() - Apply a particular relocation to a module
> + * @type: type of the relocation to apply
>    * @me: the module to apply the reloc to
>    * @location: the address at which the reloc is to be applied
>    * @base: the existing value at location for REL-style; 0 for RELA-style
>    * @v: the value of the reloc, with addend for RELA-style
> + * @rela: indication of is this a RELA (true) or REL (false) relocation
>    *
> - * Each implemented reloc_handler function applies a particular type of
> + * Each implemented relocation function applies a particular type of
>    * relocation to the module @me. Relocs that may be found in either REL or RELA
>    * variants can be handled by making use of the @base & @v parameters which are
>    * set to values which abstract the difference away from the particular reloc
> @@ -285,23 +275,40 @@ static int apply_r_mips_highest(struct module *me, u32 *location,
>    *
>    * Return: 0 upon success, else -ERRNO
>    */
> -typedef int (*reloc_handler)(struct module *me, u32 *location,
> -			     u32 base, Elf_Addr v, bool rela);
> -
> -/* The handlers for known reloc types */
> -static reloc_handler reloc_handlers[] = {
> -	[R_MIPS_NONE]		= apply_r_mips_none,
> -	[R_MIPS_32]		= apply_r_mips_32,
> -	[R_MIPS_26]		= apply_r_mips_26,
> -	[R_MIPS_HI16]		= apply_r_mips_hi16,
> -	[R_MIPS_LO16]		= apply_r_mips_lo16,
> -	[R_MIPS_PC16]		= apply_r_mips_pc16,
> -	[R_MIPS_64]		= apply_r_mips_64,
> -	[R_MIPS_HIGHER]		= apply_r_mips_higher,
> -	[R_MIPS_HIGHEST]	= apply_r_mips_highest,
> -	[R_MIPS_PC21_S2]	= apply_r_mips_pc21,
> -	[R_MIPS_PC26_S2]	= apply_r_mips_pc26,
> -};
> +static int reloc_handler(u32 type, struct module *me, u32 *location, u32 base,
> +			 Elf_Addr v, bool rela)
> +{
> +	switch (type) {
> +	case R_MIPS_NONE:
> +		break;
> +	case R_MIPS_32:
> +		apply_r_mips_32(location, base, v);
> +		break;
> +	case R_MIPS_26:
> +		return apply_r_mips_26(me, location, base, v);
> +	case R_MIPS_HI16:
> +		return apply_r_mips_hi16(me, location, v, rela);
> +	case R_MIPS_LO16:
> +		return apply_r_mips_lo16(me, location, base, v, rela);
> +	case R_MIPS_PC16:
> +		return apply_r_mips_pc16(me, location, base, v);
> +	case R_MIPS_PC21_S2:
> +		return apply_r_mips_pc21(me, location, base, v);
> +	case R_MIPS_PC26_S2:
> +		return apply_r_mips_pc26(me, location, base, v);
> +	case R_MIPS_64:
> +		return apply_r_mips_64(location, v, rela);
> +	case R_MIPS_HIGHER:
> +		return apply_r_mips_higher(location, v, rela);
> +	case R_MIPS_HIGHEST:
> +		return apply_r_mips_highest(location, v, rela);
> +	default:
> +		pr_err("%s: Unknown relocation type %u\n", me->name, type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
>   
>   static int __apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
>   			    unsigned int symindex, unsigned int relsec,
> @@ -311,7 +318,6 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
>   		Elf_Mips_Rel *rel;
>   		Elf_Mips_Rela *rela;
>   	} r;
> -	reloc_handler handler;
>   	Elf_Sym *sym;
>   	u32 *location, base;
>   	unsigned int i, type;
> @@ -343,17 +349,6 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
>   		}
>   
>   		type = ELF_MIPS_R_TYPE(*r.rel);
> -		if (type < ARRAY_SIZE(reloc_handlers))
> -			handler = reloc_handlers[type];
> -		else
> -			handler = NULL;
> -
> -		if (!handler) {
> -			pr_err("%s: Unknown relocation type %u\n",
> -			       me->name, type);
> -			err = -EINVAL;
> -			goto out;
> -		}
>   
>   		if (rela) {
>   			v = sym->st_value + r.rela->r_addend;
> @@ -365,7 +360,7 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
>   			r.rel = &r.rel[1];
>   		}
>   
> -		err = handler(me, location, base, v, rela);
> +		err = reloc_handler(type, me, location, base, v, rela);
>   		if (err)
>   			goto out;
>   	}

