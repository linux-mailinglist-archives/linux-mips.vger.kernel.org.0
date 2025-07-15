Return-Path: <linux-mips+bounces-9822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76555B058AC
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 13:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7560E7B43FD
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 11:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5972F2D;
	Tue, 15 Jul 2025 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1q7kTar"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852771547C9
	for <linux-mips@vger.kernel.org>; Tue, 15 Jul 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578648; cv=none; b=OuKWhIw1uq0Wkhy/2kNzyDTyyxWLB9D9Msv3JGmXdHRxi1Gj7I87T+E1MW6bkcMs9TdgqMJbkUPCICxy2qr1z2Rk8S7lWZFuwh+Bmr9kV/ZhHenYhIwa36OHusr2nmYufDgQEtn/fZWhhhDzJZvXjRYpyi970It9aveUk1u5r58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578648; c=relaxed/simple;
	bh=N6davSYVMRS0XhnGIJVYPBr1mWvE2ciYQFIEowvuido=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFVKZ9J6FIql3PTys6o5l2a/Vxu8KxaOLsJcjes5Vvh46QHkpytHnIXiHk09yl6sfZ0kBFvMVu1zJ8VmtC80ucxycXLkuzsPg+//pAxzVyk3n3A7wG0u2PEFyCtC49IPmOQovhq0177k6GDquplBDHQDTu1bOqPmVqzx6D41j44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1q7kTar; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-454ac069223so32072855e9.1
        for <linux-mips@vger.kernel.org>; Tue, 15 Jul 2025 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578645; x=1753183445; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRMRsPbK7uVIpCz9kv9Sklo7hdMZKeTM8NQqJUudn4M=;
        b=N1q7kTarZei2RxMdYQxLRddc5MNh06yn2SSjTny1fj2TKbI/ec9hIaAodARGD0V8mG
         NC/3XJt1BOhxB2nEuxcm9KgdrC1f0YIZDNwa3dyiM3tMrQkP3b2/VfyED1t2avb8wxrU
         LhKzQh8kCOSQQA8/WWEYXe9UD8u7BznxUFURUfdwnMUpiP5FxQmQ3QcwvuDHOi78qg7H
         lmbto/A+fB6qYOfI881ipoVd9PxWu5NOAIAKJIEFpC+wzAYUcNKmdbJo9+w3GmoYUuNC
         l34Xr24V0ylKE01By53t/PAEOKmLuszsTeHZFvx5y4USYfY4ybgySmb34d4/C61u5/pR
         nBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578645; x=1753183445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRMRsPbK7uVIpCz9kv9Sklo7hdMZKeTM8NQqJUudn4M=;
        b=wy7kjcXb7+Pr3Gc0zwMixCaIyn0hN2gTP0EkAHcDFl6r9YRlKQtvWkIY4qAdDwvXLN
         p0hsN5kjxTeTSUx/a0PbAlGjfVMf0cjDyvMEY2qvf5R//bz42oWDX8JjIpH3meNnS+Yl
         NryRztEB9KwzBnlSCBE/7cmbrbiK7Fo3FTqjnanAMpxFURASesEeS7iZ9JdVZoP6W+wU
         F9FvJdjuEfer75OdUB3slT2bcADM3aaxJmA5FbdciHtTw4zqAH3C8c6wEoJMvZAu1T1C
         Xlac2j1aiw32jvp7VEHnS2Q1puicsjVTMrPR/+KoG95l5D/tXOHIbIjgAtWhDhrL9l88
         +xSA==
X-Forwarded-Encrypted: i=1; AJvYcCWN78TFUt9Wq8IBftvnY1w8ab3DOnxUzEiFgJOllF2PkqFUK9qIDN5NL0dyZrLVShkp2llC5E3vszeR@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8bkAP9mcWY5gbpLf7B7SdqaMGbgadufQU5Q6Bz2YTVYXsXt8
	tBG2f5n7vasSlacDLQOULQgCHNUYfJDD02n+lmCH5rzfYfeufuUpNjikDDSSkkIdsQ4=
X-Gm-Gg: ASbGncvqSWtJRyEyPs1G51kNiAj9cZTgV35gwrD10yeWWtdeGQf2+qxVeq3605xmdlN
	gwwQMY6SmNkgyDA/UpKtpPtJh2V3bxEZGSOy6xG9xz5EVwzLy0KL6LmyNbSlP1YR6PtBJ4N47lw
	ODN4R4gKl9hoyjwTAeSiJHCKCEZVmTC1zOsm5kFT/W+LB9ePzxZ4n1IgV1FMMa30iKIG+OBgbeP
	KhaeubFE9AHmoLMR3265YziotOvbJTMSFkVHyHwkdsrCyVLd9pNZLAl+GjRxLxsk+hvOU6WLUMI
	W3c4Vr5yPgAQ93+HSugwfyQDjhgzviD8mh26gmHfaIHaY6c5QvQED0q92EY2eDBYYS4rnByGCJ+
	PSXDdIEQb6SiU4PUFG8udSmnWeU6DRa6vLzStSCh1hDsuqtxr4Ff9HqqoArxe
X-Google-Smtp-Source: AGHT+IHVswNM28EMS7ZkEHWVkngG54KZ/Az7bLGLzT7TPBhCqk9Wfx5NrWIyPX+vOu46nSfZllym3A==
X-Received: by 2002:a05:6000:653:b0:3b6:cdd:a41f with SMTP id ffacd0b85a97d-3b60cdda4dcmr45157f8f.4.1752578644731;
        Tue, 15 Jul 2025 04:24:04 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5f32ed100sm11943318f8f.0.2025.07.15.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:24:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:24:02 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: cjd@cjdns.fr, tglx@linutronix.de, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource/timer-econet-en751221: Convert comma to
 semicolon
Message-ID: <aHY6UjdYy4lTuonf@mai.linaro.org>
References: <20250603060450.1310204-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603060450.1310204-1-nichen@iscas.ac.cn>

On Tue, Jun 03, 2025 at 02:04:50PM +0800, Chen Ni wrote:
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
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

