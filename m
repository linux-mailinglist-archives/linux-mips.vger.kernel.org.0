Return-Path: <linux-mips+bounces-2617-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFAF89B7DD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2881F1F21A8A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD9A2232A;
	Mon,  8 Apr 2024 06:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbXFEcW1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014772C86A
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558812; cv=none; b=gjMe+mh00zOBtVGBKV63ppEfTK5AGB7jR1h9PYCDZ9vhnzKB5nCaBCOHa1YADuvv4e7UjmdC1sNfBY5yCfJ9nPxxvCM4Wzj2v/0bUIrQqh5EtRtARZ6IYl4SMsr4rRh2LkjtvjG6PymnKfqC+8IXUEpHmYR48K7gM1nr0N9lGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558812; c=relaxed/simple;
	bh=ch+KlqdcNSj0uaYiClHlSxvTsT37udZreOKjRmzmeO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeFwXxzhhPSJzAA9vzQcETM3GIGVOrRvgypDIHFVAOOC0lslXKTKOEinTHoG6ewtK30rmCYjA+A7Zp9H56aMgCSv2vhIMDphpNph9Win77zwKnsaNQMWcMN7Au6JcNNHATBVTnIwTyWr+RmDxsN5S3qlkSVauH7rUBBQ2vLDD/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbXFEcW1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d476d7972aso53263721fa.1
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558809; x=1713163609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiOTJ9TbEH9QsDeoEbILlf0/lSHaXznZNDPloj3XLmk=;
        b=sbXFEcW1Dsi9n7Vatbm16Nq4nlckQ4Xg9062r85hJhHSYJaFOY47nlg+nDwN26fa3Y
         0QtLoOpZmVYA/46zj/Av+taV7sOd/89mJr0ztvKZdiV40V4cxNyK6L2SVuUYi8yjcXyK
         1RQVugiPLNwf16hKgD/mXliLd+QYdrDh+eWsnvhltaLOK1qE+JqBzjL9Lk0vHK7JFIF8
         4OUpBZ7cbGnbRmfA68XkxDI2Uiq53GIYAdQDHpwo+cGA0QpR+PfC0Zjbtuoe92j8nsRo
         rqozO6Z042v7Oe5khwrvqM7mkT/t+sqopAGQqM/hmOXNwpbCrFLkAvl4L7tPBAgwsb7z
         BhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558809; x=1713163609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiOTJ9TbEH9QsDeoEbILlf0/lSHaXznZNDPloj3XLmk=;
        b=liMEi0M9pmAKPMWqO/scKN6544MzJY1U65tEtrva2JMFZHr/8oscsmotfWBRFrOf0z
         qbEKnmvPvvVWu7X+vYAFTsXm5N8rEWhVyrrj8gPloEXx0u49Pe8Ik+2mD8UVk+kOgXo5
         OD6i6eubBpRVUVvHwfx5PjRUCkgTmaO2ZdZabfQ+Z3zJ7vr3JMpvkPMxcoKWIbQjJREH
         lzkgr9EXn0lutwa5dVvcxwiMQrBhpDUwFnt46o/5R6ZWa4J1G16DlvFXO3hfCW0OR5s5
         AxQUH2v9GjC/PmR6FwrdOeQCUg+IJDO9qGyisM9WCYPF3sYKtEDCF+CeAN4Fox5DlJxW
         9SDA==
X-Gm-Message-State: AOJu0YyLN3/sVIXuzJ2PlE0/o6ygt2qJ4Aunp7P5/hmmpKgjhWmRG6Bc
	KChsmkEw6lFOdYc35qI4mNwdnsvwh+UMz3Ip47RTXqNtA45EeDFTYRE6O1pWMyE=
X-Google-Smtp-Source: AGHT+IFmxViFIiYuATyYEoJw4+VizRAl05g7lkRsW8jCv8UF1E73e+TFC9NTPqWivmTrBNPXuPtiGg==
X-Received: by 2002:a2e:a202:0:b0:2d2:7702:cb74 with SMTP id h2-20020a2ea202000000b002d27702cb74mr6236532ljm.20.1712558809196;
        Sun, 07 Apr 2024 23:46:49 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c471300b004157ff88ad7sm12264175wmo.7.2024.04.07.23.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:46:48 -0700 (PDT)
Message-ID: <07030b21-484c-4cb9-8b7f-502816da9a3f@linaro.org>
Date: Mon, 8 Apr 2024 08:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] MIPS: debug: Hook up DEBUG_LL with early printk
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326-mips_debug_ll-v2-0-b64abc76f2a1@flygoat.com>
 <20240326-mips_debug_ll-v2-3-b64abc76f2a1@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-mips_debug_ll-v2-3-b64abc76f2a1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 21:35, Jiaxun Yang wrote:
> Output earlyprintk to low-level debug functions when it's
> available.
> 
> DEBUG_LL takes priority over platform earlyprintk because
> people must know what are they doing when they are trying
> to enable DEBUG_LL.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig.debug         |  2 +-
>   arch/mips/kernel/early_printk.c | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


