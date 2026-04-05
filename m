Return-Path: <linux-mips+bounces-14054-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fLjmIxKJ0mn9YgcAu9opvQ
	(envelope-from <linux-mips+bounces-14054-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 18:08:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D055239EECE
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 18:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D74D30078F0
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590EA2C1584;
	Sun,  5 Apr 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyPPaE5S"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6ED218845
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775405327; cv=none; b=WghLLsX8wwYlXWAGxHWOm7dKAQu4AMwPEcj3IRBNF7K7UNasDSYhu97hc6/CW7wkRiQnYKRT9MQyWaf/6/eGXEbvAlUvHM6V8FjT0pM3pZX5VzZbW4gXiY4/zfoFFDdftCbpUp1hPtg3tbcKz02Z6E/2J3DzgFIJTPlAB7nBZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775405327; c=relaxed/simple;
	bh=MZHxb/hI5Y8/FUzweWxD4pyGtX5aab/sfI67fFuZSYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tj3b6BME80kfEVFSrsb+N+zfu2ixyNr8wgK6Mn4Eu+2tk/zX9/J1uiwl8Nm7MAUDMhuHFwcaEQkMHQ9ny0Fax4VHtYG4cnc+WklDtxEcMrqtCyegEJEft4V8g7UD6nf4vUSpSKYL0Sa2o7QoE8ANTN2S1kQDW2sUKLK87SY6atg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyPPaE5S; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870778358aso25531571fa.1
        for <linux-mips@vger.kernel.org>; Sun, 05 Apr 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775405324; x=1776010124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fo/k++xBApY2IZkH8i0PfPpzPv/j3HI77IFEVLafkWU=;
        b=VyPPaE5SIxv2Lp+zuGeW8MasMM/flqeEra8U84F4d/PoxHPhcmi4e6j3N55x/CCEEo
         NeyGKcBfJAJhH3PUA1Dm45bd1KEUF8QWpXRu+LbaMMpYf8+ZWlCTrpQ4+SfktW2mxLl1
         VH4gkMCZ9Uql3XybTLrZOIZ1gKsiO7wOuNElNAMRbajO6GnZn4H9O74OpYA9lW2C2y17
         ZyZtx61EN71SZddgZuh/rOEijjOqMCKK8Up6VbwUr52TpzrE7EXnqQgm+q4r76FTB/lc
         ZzHyY87p3ZAEVWusXFLBqL4e5Eev6qULt4Kqc1D+vfM74E0pHY2mDqGwejKth+n/tnF2
         ROpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775405324; x=1776010124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo/k++xBApY2IZkH8i0PfPpzPv/j3HI77IFEVLafkWU=;
        b=G3dvXUzyk26X7FRxhb/e0iJ52Fs+ISWMwW3KKuJmkRLAhK1W5EXkNZ/RO3tY3eAM4h
         7mpqwUhruMGXh4f1lA0Vl+xS5rMSOCx/dkZgF3h/RnJgkmNRXr/Kc9hzXqg/TqhmQvuQ
         Q0tDnvwpdQLCIGYEys6UjmPU7AWm6sA6ERuVn4ZjginUvi1P0Cif4kMb1/ex62tIvPR5
         Pmnv7zm9/vFBy2ef0IcrXf8oQxaGTn1wv6iQk5p+u30zKnPuk49kLwT03qo1wpRvvGoi
         aosamnnmm59CVc00GvT511DrvokKIm/gcJ3/jrMPOWnuMqzHZS5S14XOdSW+tt9GUYyZ
         feGw==
X-Gm-Message-State: AOJu0YxSWXRT8Io6nfX+mPPd80p3PDnfSBjYxwjQndjb0hGcPxCPnCrr
	BVC6Xpr74imBIBDQE3ADfsVXo5VpowYVkz++pTcQcD5LjYkPXEZjK+8unjcDPA==
X-Gm-Gg: AeBDiesr5kxd3Rq8CFUg3feGXyOFQsC8x+dz9CLYAgd8CWfZUdw931UU/wqtXyGSLuq
	sOSMUK3xaGPdna/kDFvFG7WBwr3VR8j0wAf4S6u0gh4D2Nia3ZQDkmKkA2UCCikgKt/0yaWumGt
	7539DKfmhgogd6QtXOUVKv5K/joY1rn9fKIH/qBJzbyd6pLip1IB1sDRfVuS0UZzbuHffKXlvC0
	XLWhCnq/DjiHM5jiU4cZLqr1/E7z9o0Jq21sWpVNAxCkcZpzYcma1ggm96DSK4nvQwSN+FIp33K
	Sk6QqgtCKTjr6uSllNd0j+BPKLMQjCHeAnbzebv8w9/bQkB5KNnxVN2HJIWrIHO2Gzl7ZVTQLdg
	0hjUyi8rgZEqHv5YjSwmmJTYHrjixhpIsjFi8zHyerMI8b6lGwYENa8jduFHWPBPlZ3K0GPo9Qb
	P7TfPcCrcyW/CgzF+KxEtPNm466ELlL+tFy4/RnNSUIMoqWPD+KxCtVDSONG24vYo+XVXMcza/P
	FmMxA1Ga9x8d85zbJj0
X-Received: by 2002:a2e:b8cd:0:b0:383:18fb:fdf0 with SMTP id 38308e7fff4ca-38d91bfb439mr26385211fa.22.1775405323733;
        Sun, 05 Apr 2026 09:08:43 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4713:11ae:8695:b8b3:ca85:8248? ([2a00:1fa0:4713:11ae:8695:b8b3:ca85:8248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd212a927sm25612521fa.32.2026.04.05.09.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 09:08:43 -0700 (PDT)
Message-ID: <c4d0542d-c442-4ad7-bf8e-33eb2e643e3d@gmail.com>
Date: Sun, 5 Apr 2026 19:08:40 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] MIPS: malta-init: bound default console command-line
 append
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
 <20260405102007.7-mips-cmdline-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260405102007.7-mips-cmdline-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14054-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D055239EECE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 5:06 PM, Pengpeng Hou wrote:

> console_config() appends a synthesized console= option to fw_getcmdline()
> with unchecked strcat() when the firmware command line does not already
> provide one. If the existing command line is near full, that append can
> overflow the fixed command-line buffer.
> 
> Switch the default console append to bounded concatenation.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/mips/mti-malta/malta-init.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
> index 82b0fd8576a2..fb782b1a3f6e 100644
> --- a/arch/mips/mti-malta/malta-init.c
> +++ b/arch/mips/mti-malta/malta-init.c
> @@ -78,13 +78,14 @@ static void __init console_config(void)
>  		setup_earlycon(console_string);
>  	}
>  
> -	if ((strstr(fw_getcmdline(), "console=")) == NULL) {
> -		sprintf(console_string, " console=ttyS0,%d%c%c%c", baud,
> -			parity, bits, flow);
> -		strcat(fw_getcmdline(), console_string);
> -		pr_info("Config serial console:%s\n", console_string);
> +	if ((strstr(fw_getcmdline(), "console=")) == NULL) {
> +		sprintf(console_string, " console=ttyS0,%d%c%c%c", baud,
> +			parity, bits, flow);

   I don't quit understand what changed in the above 3 lines...

> +		strlcat(fw_getcmdline(), console_string,
> +			COMMAND_LINE_SIZE);
> +		pr_info("Config serial console:%s\n", console_string);
> +	}
>  	}
> -}

   Huh? :-)

>  #endif

MBR, Sergey


