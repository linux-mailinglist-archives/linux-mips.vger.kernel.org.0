Return-Path: <linux-mips+bounces-3041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F388BB39B
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 21:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C391C22FC4
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 19:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C76115535A;
	Fri,  3 May 2024 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aETeJ0yE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C276502A1
	for <linux-mips@vger.kernel.org>; Fri,  3 May 2024 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714762834; cv=none; b=HXySjOWEh5On8LPSGeLXhQ3Easu5SuMDBm+gNbJ8Ffe+p+WC99DRfiJlgIOmz1FlVqQqnoOewknETIp5pu8sXzgWMwn49HFr8GbUiMuZd1Q+1ktQmVC/fSUNgX24hMbpiLe5E5dyR7HPCsaGWPcFG0xvRXPhH/jd5RbkTcXVx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714762834; c=relaxed/simple;
	bh=CI57NvU4qKUF1WqjJziOmK7hz2ZWrSQ2B/vT4ij0OoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rFpzHEVNlpm4gJpXuHNYHR1j4AQC3h2CgKPTLNHt7Mdw5ZQl6vJV4Sub+cKqsyk0gq7NY/qJJ02pAkJB/n3uw14YlxCtrv17zubzhgMEB+5gyP78JiYBjSy+oeTaO6JOuNgkgDipEK3+6I05hP+89sZ+Ok4iawp8Ztts+2RN66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aETeJ0yE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43c5c5496a3so20500491cf.0
        for <linux-mips@vger.kernel.org>; Fri, 03 May 2024 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1714762816; x=1715367616; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhhDn+7XBgBKjWgSLUapVFTVA3TbJYZrOzcpJXB/RgY=;
        b=aETeJ0yEx7RdO6qsje1mXzU3V8scMw+jJgAGlaRREs/f/T90G3+p1sIJ0BgeLNel6q
         AHXeQzFgiQcHo1kADG9RWOU8NsAXtC3qpjl5clLGqb8MU4vQQE/pgrWkY533XN5BfFBc
         5viVM0VZQep7abCS8LY5CNXwD7FtcNnLcyBwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762816; x=1715367616;
        h=in-reply-to:autocrypt:from:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BhhDn+7XBgBKjWgSLUapVFTVA3TbJYZrOzcpJXB/RgY=;
        b=Q4oQ93G5bIBpPj5Bp38gn5TCM50xXTbBIp96+p1AC1QVz0TWCyPqvmS6+2BEjTDlcs
         7QTj7jHEKrF23Y3NPuUcxrpW3vIuupZOGeFmQtagPMT8SDdpr92gTKcvxvialNqz41gk
         Z8hXg8IvMGeaviNcdbOhbVdRtntoMN2KsUv6rqFqEJrxLOnvudL8A25heKhYF2Uy7ZqE
         fNJYYtL6cznID/ydDOS3ZlV//VP59Ko33FeRyiRueaDZIgRYeSpwOjkRhCkqSderNIei
         Zad6Ptkch+jYruR/ko8uaKx24OONJuANlHkm0sswM+9lkDQha6c9RKuPndbt8GfdtrAd
         UlLw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1+fWprZQKXONNmvaoBpc5wqiE4IaTZWSuUjCX9SJPZ1wX54VUzJJzv8QRIP+5m+kLgRB6AJtGR85bWJ63C8OKOBNyH8UlsrDUw==
X-Gm-Message-State: AOJu0YwBORnXGUP+xP+qdqMKKzhWctdROny4/eOg5cfWroNXl9tYlHZH
	H5qtzTF/ZoYbVtUwXjHj/IsmgRn5RQltKNFW+wB/fsDqPFzCdJzNMAqkVnTpdg==
X-Google-Smtp-Source: AGHT+IFT9zSXXqQ+x5L4Ox2l4/RNqXi+lfQztj5D9gFXkH6MtlRkX2h+PfZWP+U5Vjrp0yfKfzKZfw==
X-Received: by 2002:ac8:59c4:0:b0:43a:d40d:861f with SMTP id f4-20020ac859c4000000b0043ad40d861fmr3321439qtf.29.1714762816090;
        Fri, 03 May 2024 12:00:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bw17-20020a05622a099100b004349bb95e01sm1849762qtb.26.2024.05.03.12.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 12:00:15 -0700 (PDT)
Message-ID: <596537a9-0cc4-4f90-9b3b-bbb728e2d8c6@broadcom.com>
Date: Fri, 3 May 2024 12:00:12 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mips: bmips: rework and cache CBR addr handling
To: Christian Marangi <ansuelsmth@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Daniel_Gonz=C3=A1lez_Cabanelas?=
 <dgcbueu@gmail.com>
References: <20240503135455.966-1-ansuelsmth@gmail.com>
 <20240503135455.966-3-ansuelsmth@gmail.com>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240503135455.966-3-ansuelsmth@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008d9b2906179154e6"

--0000000000008d9b2906179154e6
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/24 06:54, Christian Marangi wrote:
> Rework the handling of the CBR address and cache it. This address
> doesn't chance and can be cache instead of calling the register every
> time.

s/change/change/
s/be cache/be cached/
s/calling the register/reading from the register/

> 
> This is in preparation of permitting to tweak the CBR address in DT with
> broken SoC or bootloader.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   arch/mips/bmips/dma.c         |  7 +++----
>   arch/mips/bmips/setup.c       |  6 +++++-
>   arch/mips/include/asm/bmips.h |  1 +
>   arch/mips/kernel/smp-bmips.c  | 31 ++++++++++++++-----------------
>   4 files changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
> index 3779e7855bd7..799cc3e12fc3 100644
> --- a/arch/mips/bmips/dma.c
> +++ b/arch/mips/bmips/dma.c
> @@ -9,7 +9,6 @@ bool bmips_rac_flush_disable;
>   
>   void arch_sync_dma_for_cpu_all(void)
>   {
> -	void __iomem *cbr = BMIPS_GET_CBR();
>   	u32 cfg;
>   
>   	if (boot_cpu_type() != CPU_BMIPS3300 &&
> @@ -21,7 +20,7 @@ void arch_sync_dma_for_cpu_all(void)
>   		return;
>   
>   	/* Flush stale data out of the readahead cache */
> -	cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
> -	__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
> -	__raw_readl(cbr + BMIPS_RAC_CONFIG);
> +	cfg = __raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +	__raw_writel(cfg | 0x100, bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +	__raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
>   }
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 66a8ba19c287..18561d426f89 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -34,6 +34,8 @@
>   #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
>   #define BCM6328_TP1_DISABLED	BIT(9)
>   
> +/* CBR addr doesn't change and we can cache it */
> +void __iomem *bmips_cbr_addr;

Maybe __ro_after_init and __read_mostly, too?

>   extern bool bmips_rac_flush_disable;
>   
>   static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
> @@ -111,7 +113,7 @@ static void bcm6358_quirks(void)
>   	 * because the bootloader is not initializing it properly.
>   	 */
>   	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
> -				  !!BMIPS_GET_CBR();
> +				  !!bmips_cbr_addr;
>   }
>   
>   static void bcm6368_quirks(void)
> @@ -144,6 +146,8 @@ static void __init bmips_init_cfe(void)
>   
>   void __init prom_init(void)
>   {
> +	/* Cache CBR addr before CPU/DMA setup */
> +	bmips_cbr_addr = BMIPS_GET_CBR();
>   	bmips_init_cfe();
>   	bmips_cpu_setup();
>   	register_bmips_smp_ops();
> diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
> index 581a6a3c66e4..3a1cdfddb987 100644
> --- a/arch/mips/include/asm/bmips.h
> +++ b/arch/mips/include/asm/bmips.h
> @@ -81,6 +81,7 @@ extern char bmips_smp_movevec[];
>   extern char bmips_smp_int_vec[];
>   extern char bmips_smp_int_vec_end[];
>   
> +extern void __iomem *bmips_cbr_addr;
>   extern int bmips_smp_enabled;
>   extern int bmips_cpu_offset;
>   extern cpumask_t bmips_booted_mask;
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index b3dbf9ecb0d6..6048c471b5ee 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -518,14 +518,12 @@ static void bmips_set_reset_vec(int cpu, u32 val)
>   		info.val = val;
>   		bmips_set_reset_vec_remote(&info);
>   	} else {
> -		void __iomem *cbr = BMIPS_GET_CBR();
> -
>   		if (cpu == 0)
> -			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_0);
> +			__raw_writel(val, bmips_cbr_addr + BMIPS_RELO_VECTOR_CONTROL_0);
>   		else {
>   			if (current_cpu_type() != CPU_BMIPS4380)
>   				return;
> -			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_1);
> +			__raw_writel(val, bmips_cbr_addr + BMIPS_RELO_VECTOR_CONTROL_1);
>   		}
>   	}
>   	__sync();
> @@ -591,7 +589,6 @@ asmlinkage void __weak plat_wired_tlb_setup(void)
>   
>   void bmips_cpu_setup(void)
>   {
> -	void __iomem __maybe_unused *cbr = BMIPS_GET_CBR();

Could keep the local variable here to minimize the amount of changes, 
should not matter how the resulting code is generated, as it should 
cache it in a register.

>   	u32 __maybe_unused cfg;
>   
>   	switch (current_cpu_type()) {
> @@ -607,17 +604,17 @@ void bmips_cpu_setup(void)
>   		clear_c0_brcm_reset(BIT(16));
>   
>   		/* Flush and enable RAC */
> -		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
> -		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
> -		__raw_readl(cbr + BMIPS_RAC_CONFIG);
> +		cfg = __raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +		__raw_writel(cfg | 0x100, bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +		__raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
>   
> -		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
> -		__raw_writel(cfg | 0xf, cbr + BMIPS_RAC_CONFIG);
> -		__raw_readl(cbr + BMIPS_RAC_CONFIG);
> +		cfg = __raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +		__raw_writel(cfg | 0xf, bmips_cbr_addr + BMIPS_RAC_CONFIG);
> +		__raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
>   
> -		cfg = __raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
> -		__raw_writel(cfg | 0x0fff0000, cbr + BMIPS_RAC_ADDRESS_RANGE);
> -		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
> +		cfg = __raw_readl(bmips_cbr_addr + BMIPS_RAC_ADDRESS_RANGE);
> +		__raw_writel(cfg | 0x0fff0000, bmips_cbr_addr + BMIPS_RAC_ADDRESS_RANGE);
> +		__raw_readl(bmips_cbr_addr + BMIPS_RAC_ADDRESS_RANGE);
>   		break;
>   
>   	case CPU_BMIPS4380:
> @@ -627,9 +624,9 @@ void bmips_cpu_setup(void)
>   		case 0x2a042:
>   		case 0x2a044:
>   		case 0x2a060:
> -			cfg = __raw_readl(cbr + BMIPS_L2_CONFIG);
> -			__raw_writel(cfg & ~0x07000000, cbr + BMIPS_L2_CONFIG);
> -			__raw_readl(cbr + BMIPS_L2_CONFIG);
> +			cfg = __raw_readl(bmips_cbr_addr + BMIPS_L2_CONFIG);
> +			__raw_writel(cfg & ~0x07000000, bmips_cbr_addr + BMIPS_L2_CONFIG);
> +			__raw_readl(bmips_cbr_addr + BMIPS_L2_CONFIG);
>   		}
>   
>   		/* clear BHTD to enable branch history table */

-- 
Florian


--0000000000008d9b2906179154e6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIKzdiF5/g6W64Zjl
+DuaWQQm4O0Ft09eSf2XHBKqUIOZMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTI0MDUwMzE5MDAxNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQDLGPaPwfv1BDOVMkWrY1mWsuMeurUkrQFo
QdwxNE3v86JIWk9AK+vFNxQo9Vl1sT16pm68fmP9LG35SmqmrFMUsnQOCngj7meQ018RFwYG22vR
76jmd5C6T4pz6srpdpqSVQ3LS0UkmzJ3RiFvECza87DovVqvSuBkGKq/7qKdtTvg2By5fAKaOYf3
NcfokE/yjjM6ushSWWLAyYTWSusEu4jlezVNXSfZQTMOggXzU3TeqyYv7568QZUXgmRrWq/FA//m
PIdAZYDS+T86N9XQVtHHGefsclOCpLlU//CAfVAbWSQXqFQb1+yH6Ap8bYeQw8XWcssyJJ+4mcsp
xb9R
--0000000000008d9b2906179154e6--

