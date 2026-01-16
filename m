Return-Path: <linux-mips+bounces-12945-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39113D2D05F
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 08:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCA31302082C
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 07:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4EE23815D;
	Fri, 16 Jan 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bNk/LHLJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C271DC9B5
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547721; cv=none; b=f/KEAl9Y4hR0jfk5q+nYHDQ3v7yG6wJUZ4BamnBtmJt5DDZulUGdasCo2IeZ8ApRhYze0FwOVYRSvhuuwTD/ZtbNHJIupKX0du8Y4QqlE91keODbOJJjUtngtOfcFTSoTBUIeH7h1V4oit9XW8ZyM332A7cA2NkrIt0OU9dEEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547721; c=relaxed/simple;
	bh=WOkNGd/6bhym7+utziG3ODS8msK2tF2yxZ4+2JhBkpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz5ErzDojH2VH2uO1rxST7XJ9JPBGyxbbB3qvzN2yFww/J9w4lK/U5FABz4ODJZdJ+gK9Z41cKGZkfHjQgXHsc68hLa5CfYWTXQvp42Pc1F6Sv1LTJ9D4cVqShYKjYJCGT3W9T8iQJm3FGv7KVe5UDJz/EEw2fqKWTeKmaUJdmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bNk/LHLJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fed090e5fso877574f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 23:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768547718; x=1769152518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5QCORoMbkphC/1jrtqJnWhwyxakPAQDBnkju4ETcU4=;
        b=bNk/LHLJpgvJTIhAEAHQH9CeQ51uBIvhdrm11UiuXO2WCY0fihEY76Fa5bNBhkq3M8
         G4QhaVQevhohIbWho2ZkX0HqMLr5l43ICMWbzjseg4ws/FrtDKUc+/aWA5Cw4o8dwN9/
         Ib8rQctdX/vF7E2SE+4buJ9oCKw6Rh6tbDLcnCo0kJaZNTtZwZaFuPm/rPyWQXigRcqC
         PP0MnB8/N//dFHi82v6j04pbCmGSH0j9lFVqwnkpMoQtRPfUpQ2S9qCK04E7x59y02Tx
         R8iRiWrLsBs8T9OA0qCeMwig1ixtE7ye4dKUGyWLmS+n060PXhYDPuE4Bljd1cKSKFj5
         VQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768547718; x=1769152518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5QCORoMbkphC/1jrtqJnWhwyxakPAQDBnkju4ETcU4=;
        b=rM/1pEMPDqITGSpJPdPoGzr2YXEucrKnPLtHo53VPJszonS6UGKv7VTb5YNiX6TYUQ
         6BWFrkUIuiuT3+Z0tDMxRLe5GAD1pPin4JlTOoKCgkcYGr9P2I4v1WQr8xfrnSkY1Qba
         3MrITb+ilONwrHhYPIc5a5Np75Y9gJXs7RJGGR5HYpRdL3TUbVbzlFlMKf0jYQFSC1sg
         fcxwy+2k6lhQMphSeLNcY4EmNkvQfqfc3yqrwccPIsWYfM4CMoKHVITAy5hYCrU5DIxS
         Y6L3G2Ms/E8rzb2HpTPpBphExsF2y49qnJegDWEqJ0v7oQ2u0LzptO29vj/9ESCMKeLp
         a8ww==
X-Gm-Message-State: AOJu0Yw7F4e0KBsfcJ9wJ1VwaNsxxW/BiGIybGTNhHvYGxkVfqkddAZZ
	k3rQaPCuy6w+JSqalD5cLJ/Di+0A0uQrLA8IAryqGyUF2ObCe3nsrayNk5GeMGYj4qo=
X-Gm-Gg: AY/fxX4YfIkeOjhBeY2NfqyEXzAbc8XD+0xoZyP9PmtPshldsbVogYN7qLOpq2932+H
	BaihaQfG1E35PPuk7TpO+a942dxSLvXj7Xbk33Lofd5jhjjv0ii2btlZO0ZENootdaTTnSAg6RD
	ZG/fzmpUXBdkbGjbE6CzILpdF++kpcj48nw632yDF6RNcpPpJ8qOpeyoyVWVjsAyMPIQIgifPp/
	goa7xZ3rhRHqZq4fvSxLHzNwjPmafdtmb13BAm6JNLBuElE91dOjYI+A+XzM3X11FTd4oBLEP29
	QD4m52WN74YjngGKC2Azz8bBpjpv3uOwhBNLJCCnU5bxbK0ccsBVMoe7shhihHs4rYCJ9jPe7Zy
	t846DYBnmL6vP6Fitcd+wZb2skAJ4Dg1lbRADiFBp/HioEINyXfZ8RNtXcJtIrMAIBmzXTHer/s
	E7pbKZMU4fbO/kHdZWZQ==
X-Received: by 2002:a05:6000:220d:b0:42f:b9c6:c89d with SMTP id ffacd0b85a97d-43569bcc1b9mr2254668f8f.52.1768547718155;
        Thu, 15 Jan 2026 23:15:18 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm3418486f8f.11.2026.01.15.23.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 23:15:17 -0800 (PST)
Message-ID: <bcaa0b6c-48e7-4407-b399-cb5b998dcfa3@tuxon.dev>
Date: Fri, 16 Jan 2026 09:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] clk: microchip: core: update include to use
 pic32.h from platform_data
To: Brian Masney <bmasney@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/26 00:48, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney<bmasney@redhat.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

