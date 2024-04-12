Return-Path: <linux-mips+bounces-2734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32C8A25FC
	for <lists+linux-mips@lfdr.de>; Fri, 12 Apr 2024 07:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E6B31C20FAD
	for <lists+linux-mips@lfdr.de>; Fri, 12 Apr 2024 05:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9A11C280;
	Fri, 12 Apr 2024 05:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+PqjxQg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DD41CA80
	for <linux-mips@vger.kernel.org>; Fri, 12 Apr 2024 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712901144; cv=none; b=NlhBYuKvsGFk6b5ULwulkQ7r+m7y0JEbfSNQnC38N1//h/RDIkJ76aL2fWLdA5vZZ3UqESKn1117OVqtksEj/V7VHgyGy0S6KCtyqX91COP45E1+eyyA/NnFq8hU5vqTUceM6RjUammdziNt6srXSibYcEKysF3tbO/MtSZsZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712901144; c=relaxed/simple;
	bh=Xk89cVFkdI52ZyYOY7Kf6L78ue6asWefaNYNc0ddo/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QexhLlBHmxkA6PBHKqk5HqICQ3vFd9msaZhjzBhLfTPvoRFtVl40rDOVya0OFTIVtduHcpalvHsow2avh3KT7ihIxTzfZyVmicMNvzhnMF9euSJhQyHdRiKHfgJJa7URVDg0gzgk+Ldsv4PuqPxynIynlM/lNAm75FqAkkuDBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q+PqjxQg; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso426378a12.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 22:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712901141; x=1713505941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5k+qpIN+bvCtZK47zSdCc5SpgFpAXhOx3I1lcWOdYRY=;
        b=Q+PqjxQgvOjxZ5hnJUQXR/Ow3sDN0AyHJwJwbg1X39q7ocXIJKkCM1qjTPLEoitVFE
         3z6nK3iagvprth2JuExAmHyU668b4BVktP+HGQjnw2q53ttE4G8CHTOn+N/hK8XIXs44
         BDBkpEy2E/4pCBZuIl8/YHk1WJ4R5fKRnV4iLhyypNAij32cQF12gKqa8mqwAMoF+48+
         VhcsRMZG+EXuvI6caxbOKf7Oqtu8/JinhsM9gvGJSRAVNe/kA0xYU5F9rUlSRc0tULNe
         OE/mE3Oxxyv16mCmIh7q9bWnfX8MQNKy/Xhlrt9jas6EyC6eeE7qL3kYpnL2TOhTlwTY
         f5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712901141; x=1713505941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k+qpIN+bvCtZK47zSdCc5SpgFpAXhOx3I1lcWOdYRY=;
        b=FNtL9w/zFVaY8cBvNT7sduZ1/aD0HWoVW+GQC4RCthY3NLqbLuQuFKY1CGh16hvSMW
         x7zi1ozI5YOak7hDttoWLZn6JOcJ68QPLDnVk6Q6NWLKwO55YggOqjV1qfq1pZCfMmXr
         wsZK6Akj1YsE+laEagOLwn3Zf5PPJy/FQhkDLw40xsL4p3/IX3uUEed6V3HwVrN1InL3
         idSCEXj/4i8rVbp/phngGcsSqnR5OEjZWI89Z8xF7q0y0R8QjgwSeSsboGkKCTV3rYSO
         xwSlsZFNCWTDxhxnEvWiiGo3YO3io0gw2985D6W776GQtpFWpeG85rXeKE9iAXeIKp4q
         CKnw==
X-Forwarded-Encrypted: i=1; AJvYcCWk2WqTXGZJw+rgcQ/d3ZU/WL7atq+CIUyHJbNNQzbG2mFt3b+SOgXiR/8dJw9sCCq6ItCjGuMR99K82THq6pyw/s7ur3u88Kg64Q==
X-Gm-Message-State: AOJu0YxeSs/oyOBeSlxKHzVCxBqaJFYrl8WsdnLb9bWObewpiLnefuZR
	px1E0yv9xPBlUnyYwoimPjH/dfsosI8YWMc0xintTeiuFWdVdvy1Gn3sx+AgIQbdDidVHBr38Eb
	w
X-Google-Smtp-Source: AGHT+IEXREnuzVi1AWDuu5Crjz5K7NndQbQAQd/ZmvZa+sa7/KprNUAKuey8qhUFNPPhIvMOzgoHQg==
X-Received: by 2002:a05:6a20:7489:b0:1a7:8978:a6b1 with SMTP id p9-20020a056a20748900b001a78978a6b1mr2458815pzd.16.1712901140744;
        Thu, 11 Apr 2024 22:52:20 -0700 (PDT)
Received: from localhost ([122.172.85.136])
        by smtp.gmail.com with ESMTPSA id k32-20020a17090a4ca300b0029c3bac0aa8sm4157940pjh.4.2024.04.11.22.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 22:52:19 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:22:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lizhe <sensor1010@163.com>
Cc: rafael@kernel.org, axun.yang@flygoat.com, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Remove redundant exit() functions
Message-ID: <20240412055217.soyzvivcenoadt3m@vireshk-i7>
References: <20240409141909.4413-1-sensor1010@163.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409141909.4413-1-sensor1010@163.com>

On 09-04-24, 07:19, Lizhe wrote:
> The return value of exit() is 0 and it performs no action.
> This function can be omitted. Please refer to the end condition
> check in the __cpufreq_offline() function.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/cpufreq/cpufreq-nforce2.c   | 6 ------
>  drivers/cpufreq/loongson2_cpufreq.c | 6 ------
>  2 files changed, 12 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

