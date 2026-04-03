Return-Path: <linux-mips+bounces-14024-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FMPpHA50z2kewgYAu9opvQ
	(envelope-from <linux-mips+bounces-14024-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 10:02:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF058391E2E
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 10:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 752C93019926
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 07:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8199236826B;
	Fri,  3 Apr 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiyB4Zb8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235A221D96
	for <linux-mips@vger.kernel.org>; Fri,  3 Apr 2026 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203118; cv=none; b=UZGxOkh2LEOrvE11J9k8qFRmHvl2wtheBQXweYjowLb2rsHRQQr+07HkPiu7sO/PdATV0A3xqrg7HfQuvEZlI80OrmvaVLorpcX6O63CQqmppwcWbZ69KKyNIul+1/Rlm8yU0fLCAez9G8W6twvE+xdyN52LTV4WikQcYULfFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203118; c=relaxed/simple;
	bh=iyAB7gII/1CNHhLdPYcLIvBYUxpBRetpu0BGjIDOoAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTJ7qNlDLbW/fiuBs6DQjICst1/NhAtMaSv9Mw3k4xqCC134vsDXekNBimbmuebqLhrcazREe/8ba3Ox+n2oiaB0eQnsWg/kMzdCOyTxF43RO9ViV7oED+WaLrED5Jffnj49Ttksiw5gILx9pba+dPHQ5nT83ohiqcceWW2vYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiyB4Zb8; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38cc0b91b01so13089401fa.1
        for <linux-mips@vger.kernel.org>; Fri, 03 Apr 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775203115; x=1775807915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGCHyYl1z+dat38USyLCtY9Jhy0Oc9fCrN4Rc2ieXuw=;
        b=jiyB4Zb8Enoee+9+qMsNydnmbuum9bv1n4E8XTCwFiRJaan80utZQxF0gOI+JdMTmG
         yG3Vv9UOpjuT0e6ed/QBel/6PjQ+48j6FGywPRzN8hV7xMKffyinegdxC9Af4/aCC32O
         Uk2IxWqkTIYDOVo7jltrgpDqmTzqrqG6XIM/1mTsHY2u5zBw8OVt2eNREcTJRmViyJGS
         xOsUaomVeFRvMqTvVcayD5nr6PDxlFHZb2W6//ZKBn50FBJ5sLk7FxM7tQNMeCL4SoTR
         OfsHaV0KhI79SWfS1zrxWrT/K3CxI4JcYXtgIXC+hLD797p3OInYjoxTh/iwTSngBj1Q
         3kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203115; x=1775807915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGCHyYl1z+dat38USyLCtY9Jhy0Oc9fCrN4Rc2ieXuw=;
        b=cGqLtlUL+T3fVna2eXq/u/5t4Xg6bZSeKUFRLcSyeRW97ILkcJvTk6UMMgyJViT2Xh
         51mLdLgA5RH7OqSR5auZtI43vYEMJZnCTQULmw1Uh5un3eSI340hjssQrTwDJHqTmN5h
         YXeo9q67I/VpOOp05m3M/OYh7IKXY5I9qocg5m5FOymidU0UlUjFzV2TkA6fw0JtpQCD
         sEASVBFc/2TRJr7FXGWV7pjT32AGX6RRX8KtG1noBWX7FtQPVR5bgiln+A2KZ+0tOnR2
         0UDFkAzUvMjsXTK4roILxAhi+nS+2kwRoiuv85VnXx9H4jQ98RXiRW3fknxXhwy0GxLq
         bFyg==
X-Gm-Message-State: AOJu0YwKgMH60VSn0+y4ibHRlYWcieeRXtAM5+DgAR8gVCVtP4ook8pk
	LgibiEtaVBx+z5ayeoQ1rY9MfQCfYE5xCXoYC9NjmCZmBv5G8IuR7CZReOeHKg==
X-Gm-Gg: AeBDiesVpE4gfNCPdAz0FBbvAS+3iF7ma7TzX79XWeSPEsi+MxJLQBr86YTH8DU7vUo
	t8O2sIStTiiJN0QN1/shdp2thr2kNvMwY31wzdS0bGMOjnJyn4p4ZWV0GT+Ul0xiZ9l2A2UfTOL
	PaRZogN7VQPpaURwPj95aVfUbFZq+P7/rbKs4KNXPs9iyskr8Uk/x7meHcEvbE23eK4TBzHdIKV
	PoalHW3EzW6G3izqNi1wyEmlrhzjD7kAZN1pad7UVV/ErRpDPnawoYojFYIYrmpa6VO4TngWW59
	yeifvGIB9Qe/fD6mR9KYN2WfU02L/PWCro9Y+etwpuhw6zFhLoPVmbeXxQb8YSLXp8QhI9lG42N
	SZI6kg9MQEPE/qBmGHtJChvLy8MF28oM4F83Lo+L57ph7ome+jzaTAV0/pkxMPMEw5NW78UluYV
	sjSZzmZD02WQx03nv3JELghdOnImOkZsghhLfgOWXO1FGkyAY6Buygz4xkCQJDH9uiwAOjoLxTR
	wHzA7w=
X-Received: by 2002:a05:651c:41c9:b0:38a:2917:8546 with SMTP id 38308e7fff4ca-38d91d4871amr6012871fa.30.1775203115008;
        Fri, 03 Apr 2026 00:58:35 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4251:186d:5db5:ce7:dcb1:3a02? ([2a00:1fa0:4251:186d:5db5:ce7:dcb1:3a02])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd20088a8sm10758341fa.18.2026.04.03.00.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 00:58:34 -0700 (PDT)
Message-ID: <591cb5e6-26aa-4ed0-9298-5fc4c9742071@gmail.com>
Date: Fri, 3 Apr 2026 10:58:32 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: validate DT bootargs before appending them
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14024-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF058391E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 8:41 AM, Pengpeng Hou wrote:

> bootcmdline_scan_chosen() fetches the raw flat-DT bootargs property and
> passes it straight to bootcmdline_append(). That helper later feeds the
> same pointer into strlcat(), which computes strlen(src) before copying.
> Flat DT properties are external boot input, and this path does not
> prove that bootargs is NUL-terminated within its declared bounds.
> 
> Reject unterminated bootargs properties before appending them to the
> kernel command line.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/mips/kernel/setup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index f9b228e33f3b..dd7915110820 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
[...]
> @@ -541,6 +542,9 @@ static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
>  
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0) {
> +		if (!memchr(p, '\0', l))

   Maybe strnlen()?

[...]

MBR, Sergey


