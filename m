Return-Path: <linux-mips+bounces-14134-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ML/J5gE3WkZZAkAu9opvQ
	(envelope-from <linux-mips+bounces-14134-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:58:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 143463ED9FB
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C8BA303DABD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE453E0252;
	Mon, 13 Apr 2026 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAcNiDnL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15483B635C
	for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091931; cv=none; b=ZfPDK2bFp5Oeryv12o436m9TnwGzSD2J/EnPicGWqSVM4ZMMXyL32kAiuHPv4JOO8ck/Q9mWD5wyepw1jFIEalO+py/IuP6L17Ko4Zvhq2zpi9Mja/MfF3MWcS+ix2jEsv5SrnMFr6M44zIb2cV01TBXKsLgMjRmZgvvRnzJSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091931; c=relaxed/simple;
	bh=1N0Ic5mYUVLGnYhpTIZaTdXVn9fN+yf3lS+ceRSqyvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UslcBqYHi9lXSK8jPp8dgWEfgwfRTIqtWfQbSyIP+NpspoRrpAPFmg+UO9v5eSW1hLLqzfzbJLdKuCLzxe1CLDyvHlIdYky+PnVhhRqhX64HUP0gNz/GCVNDP7U06VG0XhK4qWThzqWwrwoGpyaQ2JeXjpDpq2No5uQlZH2jR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAcNiDnL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a3e5b4acc1so3991946e87.2
        for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2026 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091927; x=1776696727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhtm5HeXPEPA+7QwbI5rKeED2HyI8ZR2koXSJnjMflc=;
        b=HAcNiDnLQ5QaRDdDIdvKu4ka6q4Kd2NFGGsjYZz4e/a90ekQt0mUVCYjTjjSehpqzO
         a8k5pO+31vftXVym/J/+PZVUoDEgyO3w02GfdMtTSBa5MXRZtfDBrK5cqhgsgevF8I08
         jwqTJKL+YRhx6v4Mknm3EteMoek3kLViNLlGDpexcxaxT3cKDOWV05gzpYfVDGpqk7To
         mOh/4yr7KV2zjZg5ElFklv8CpXTF1waRkgRugRqBi5FmDyxJ5fIOEb6iPaHgRr/RFBbr
         zpEY0kzCajG+9qWskxO69U3ZxhBDKWIit2qBFyRskVrhmgs1CsP1psx2jjmY0tMNNszk
         PkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091927; x=1776696727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhtm5HeXPEPA+7QwbI5rKeED2HyI8ZR2koXSJnjMflc=;
        b=AGvoCx2m7oL30zVNIxP7iHyy5WSFx/LKNIms/u6lfX17QF1+0iaXPDNgKL2OuhQJ+y
         3J4rYcEw8bu4nY8oG9GWiQ9/lSNIMa/ZI01nukM9tJEM6utoo9rDLMHTLSMnbAppvGzQ
         /UiTB8LjriVaubHulgcO87N+3cXRHEe4n65vo9v8AIDKtBgQnmJQX1qq6yGIzKwArDYm
         FYKHBmP+4cJvy9zrtE1DRB0g6PYfZA/3bUFHxmPOuCok6upOhtayIxyURVwEcCGXUJPA
         i1olH98pAjrpSe4Yv+VIoOYM4G5C8gHliC2LIkQ6JeSnf+OjE3ZWpQypyC0UMPsozXYp
         7eoA==
X-Gm-Message-State: AOJu0YzMK3gMPqgvxuzwUAT3WXlBbuh0YXg5eKDiej3O8TSageYlwxMx
	bDp7Md5THgwNROTqZe1kZy1guk3btN72bZuDDvhR9oDFxUMsyofUl+Y8tVIDrw==
X-Gm-Gg: AeBDietzHIXl8vMeiRBmvQaUx0sKbkPFzOrUE+svwuboPjpWtQzOoFDl1xgT6o4JSaG
	PKH1RPe3NJ2bP+foPnsTze2uZq3o8F+9VyrJSvQdr/H4wgQEGjI09vfW2vFdQwp6HI0tlGYc4B/
	qztQZZ7YAXt+1UlVH3FUbFjywVxRN5YGDBoRmizJw69kXLQrdc0yAWKay+PojrnKvrIhnPOGooN
	Fk8G2DXt8NA6+XX0JKTvKyugs3mo8AoGqn4MxwHCjFJhSNw7W+Id81SU2pvIOacxuAuyF00LSGH
	ifimCyWN7kX7QseDQeUluMLNtJo7IxrV20JStkPSdyrS/6TywSW4gBwTVFmC4PBx5T5A3LSPh7R
	8g2sOrH/aR9ARa1m23v/uizAXVMjhh8IjgwyS4bdxoht+B8azX9PT19xSQ3tYQ11LTgXyt5z4a5
	4mNMBUW2BUhcKPgmV5yZ5AKuovudNp7dApetn4n0qV0n4JhVGsw0Wnkmv5nm445Sy7fEUEqjrmQ
	HEHa5npX++QUJnEdAS8
X-Received: by 2002:a05:6512:2551:b0:5a3:f2e8:68ad with SMTP id 2adb3069b0e04-5a3f2e86985mr2703397e87.40.1776091926462;
        Mon, 13 Apr 2026 07:52:06 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:48f9:47d7:d220:9351:3e7c:f662? ([2a00:1fa0:48f9:47d7:d220:9351:3e7c:f662])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee120csm2590881e87.48.2026.04.13.07.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 07:52:04 -0700 (PDT)
Message-ID: <6ef275d9-af82-4d30-be41-bd70e384be1a@gmail.com>
Date: Mon, 13 Apr 2026 17:52:02 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm
 on interrupt handler
To: kpursoty@proton.me,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "cjd@cjdns.fr" <cjd@cjdns.fr>
References: <kukRFNz-gOs6wE_tlx8tRrsA1OIoT3LiP8OLLgIYZxFMvnh3ncsCuX037qaysPkg1KHBXkbwrU8CqUmmuxilvpTdK6TOEXRVKokk_Fi4WUs=@proton.me>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <kukRFNz-gOs6wE_tlx8tRrsA1OIoT3LiP8OLLgIYZxFMvnh3ncsCuX037qaysPkg1KHBXkbwrU8CqUmmuxilvpTdK6TOEXRVKokk_Fi4WUs=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-14134-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 143463ED9FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 1:12 PM, kpursoty@proton.me wrote:

> The interrupt handler acked by writing the current count back to compare:
> 
>   iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> 
> Since the interrupt fires when count >= compare, and the counter advances
> past the written value before the MMIO write reaches the peripheral, the
> condition re-asserts on the same bus cycle. This causes a tight IRQ storm
> on CPU0, stalling boot at T=62s (measured: boot never progresses past
> clockevents registration).
> 
> The EcoNet GPL kernel (arch/mips/econet/time2.c, cputmr_timer_ack()) acks
> by writing the *next* deadline, which puts count < compare and clears the
> pending condition. Write U32_MAX (unreachable before set_next_event()
> programs the real deadline), consistent with cevt_dev_init() which also
> writes U32_MAX to park the compare register at init.
> 
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
> ---
>  drivers/clocksource/timer-econet-en751221.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -68,7 +68,9 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
>  	if (!cevt_is_pending(cpu))
>  		return IRQ_NONE;
> 
> -	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> +	/* Ack: write a future value so count < compare, clearing the pending
> +	 * condition. set_next_event() will program the real deadline. */

   The multiline comments in the kernel (with a little exception of the networking)
should be formatter like this:

	/*
	 * blah blah blah
	 */

[...]

MBR, Sergey


