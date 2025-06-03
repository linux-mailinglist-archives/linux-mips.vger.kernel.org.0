Return-Path: <linux-mips+bounces-9157-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BACACC3EB
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 12:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E40E165100
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFE1A3165;
	Tue,  3 Jun 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="QU+CHtdQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8281474DA;
	Tue,  3 Jun 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945124; cv=none; b=VIhDVX9s4a9OdJ0C9EL0mcEEutgKqGMSNUy0+5JD7J6B/Rl5hloc2f2i7QZFpjp40dL/fE5E00JbXh9HS1Tt4B0jkjW5rbbaqDx4Nzt4qKT+qL2Z0aVe9Gw/RMkGMa7jF5kRzD/mc4ZGN22OiTR9RqjyqsI3Ig1ayZVoNTguJ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945124; c=relaxed/simple;
	bh=aKoy2voj3JHmEctto6vb4+o785Xz/xT57sWgjO2fDRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0uIjC4TRR7KpSuLQvzNBRGI35palYJYcfAEoyKcK+LgylYDcKoGthv2O3jgMU/Vg36l4n9Ngiow2SWQT74VnR32Yv1+f8WT8nu1cvEJV1CTJ363GNquyaGo1dZ9Be7BDeUQ8/wsVlZ88p0ANVf+V88lcTgCdWycuv7OTMh6zrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=QU+CHtdQ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8CEC23F5A5;
	Tue,  3 Jun 2025 12:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1748945120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OozP1XsCyy8/ehPNzN7eul+LCLA7VroK5+qN//FqHpk=;
	b=QU+CHtdQKDKbIAfKd+VWlKI/QgUo3zNgG1ax/arBms7uOUDqKF+rdBl0OVMo3Q7wPAJ5ga
	4A0BomfmYsDHgSApvBHyQW6Yo0AUVEbk1C/WiBobYWTyRgAWc2rFDS386XbYw/rJsN6Mz6
	NBvOlKMT8KunmmW8gXt4XvoT8DR2fb0bd6HzPe4xKNP/CrMm/XMRuTK1e24HQ7/VY2di9L
	3C3A1UkdhkdYMMBi9rOv69D5doPAZOZIsq9G2DflT1dbXk8NuS9vEvm8lCSSMxx7c1mddt
	4uc6esSRvnIDDw980N61jqpvIxA+YXaIY0s5R2Msv54VdOLYBK8YAI7gH5d72Q==
Message-ID: <c40fd836-ac63-48d0-93aa-8dd5f3dbcf79@cjdns.fr>
Date: Tue, 3 Jun 2025 12:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] clocksource/timer-econet-en751221: Convert comma to
 semicolon
To: Chen Ni <nichen@iscas.ac.cn>, daniel.lezcano@linaro.org,
 tglx@linutronix.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250603060450.1310204-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20250603060450.1310204-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 03/06/2025 08:04, Chen Ni wrote:
> Replace comma between expressions with semicolons.
>
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>
> Found by inspection.
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Tested-by: Caleb James DeLisle <cjd@cjdns.fr>


The comma was indeed unintended, thank you.

Caleb

> ---
>   drivers/clocksource/timer-econet-en751221.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> index 3b449fdaafee..4008076b1a21 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -146,7 +146,7 @@ static int __init cevt_init(struct device_node *np)
>   	for_each_possible_cpu(i) {
>   		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
>   
> -		cd->rating		= 310,
> +		cd->rating		= 310;
>   		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
>   					  CLOCK_EVT_FEAT_C3STOP |
>   					  CLOCK_EVT_FEAT_PERCPU;

