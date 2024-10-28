Return-Path: <linux-mips+bounces-6508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE8F9B35EA
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 17:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943BB1F230EA
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 16:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808E91DED5C;
	Mon, 28 Oct 2024 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNWknaBG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533C1DE894
	for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131796; cv=none; b=MQMgxt7SDqRT7kEeik9K6JYUp0rSpIY+PwDO6Hd34NBhYXjpe+SgfBeQBeBs+bentVsEvvrmyTOOP7iBwUTEg2ZIV/YhGvigNQMGwZib1QxTanjqDUCXrZpQC/g2MzabtEijZgzQAK/TQZlLyIH/ohpuhwDxPtzb34E6jpsX+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131796; c=relaxed/simple;
	bh=+b/MyaPLGeMH+J02xPf5eFNqGZvRYnJsY/j4056UEYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9krxIeDiqV/HPzDfvf9CRZibPf73mYN6MOD1MY0l21iyo8Uwy7qv7jBnTe16HldghKDjPDNHXX0Uti9/p5R4NKsofJf2GGZo6JPNNSptD94FZ/GQrvX6ituip1mTNpwsbenkawnz3VYbcRNdYZoXgm5wIC5Kd+GSxkR7SVaMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNWknaBG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a007743e7so5148527e87.1
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730131792; x=1730736592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUOf+2i5aUFshl4AvGfBjaf1hH/qEyiEgUB/Q9l/Ojg=;
        b=DNWknaBGFI8dUJIkKwss+UwBhm+8gkU0WjGJqyMDQsJTA38HffYhtWv39FJ4GEHnFy
         bXFV0+4B03Qq6aMRLbY3sKNfkcbq+TTSmZoN+S8jT/8H08uswQ84nyBjWLgLZ7OpaKJk
         NCfOueuvot9/20PE6uQUQ2x7FjmNM5i4w/aHv249DoFgxNyQ8JCDs5YP09Qwi9u9hHF1
         uNGeUCDmIFIbBsCkQdIfi6UH+N3tWfHzZHmGRk8E245LVNsZWzH8svexfdmVVnN0ilWN
         L64cWIUH2/vTCLgOZIeQ03dSTpyXZif2eJlrLxm5DUMZGtDJn4FhCm5fROsQVTIy8T/Q
         niFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730131792; x=1730736592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUOf+2i5aUFshl4AvGfBjaf1hH/qEyiEgUB/Q9l/Ojg=;
        b=vryHFKWS0jTQUyB650Pq944Lw8Ir/WpClU/CpiKMnlBm0p66ZU4DQ3its55VsWjMg9
         VUF/QAcYDFf2LYpWSWkVEj6kL41TB8dJd+QtQAuzoeZ74/s918rqUP/o0Kh6Gytue2WB
         iS7i7q+plOMBxGTnrE885L7yZaunxXd6cgMVLLaJCbZ/HFfTKb3eislHnMq8lgn5HI19
         o5zcF3nxd/uAJcezqdw6v+KEPX6HFT2GdPPPlOEQK+kjum3Azmq7a69zP4fkAHLBkSHg
         2vzYeqOE8pahFjo7k3qZiB2XgiCKTU6XuVvw6eqA+WhNeZtY//s1rMoa7NcA1g81QACn
         ySBw==
X-Forwarded-Encrypted: i=1; AJvYcCWVc7TG+kNYyVeSHWVuBO9aEOTuVOA2OvVXf90q2Wup4M4wK6+0jIzZH1i8ORo/aX42Quput4NZWtHa@vger.kernel.org
X-Gm-Message-State: AOJu0YyKk1t3wHIZwb9rAvjDsL0v+rbFgnUGpSok/jLeOUDNkKA4E2r5
	0v4pbeFzAjqyeLRSZfxlMpMskqAj4f3G+oc84u0Kl4aSyFpblPXlwTOi/8V8wkk=
X-Google-Smtp-Source: AGHT+IGV6OU0uVOT5nWX2cCVN9W8M2w0HdH8GvanfoiJUQLIPhEhfnHOI1c0Kc+LfdbKpg1L8jQpMw==
X-Received: by 2002:a05:6512:3c96:b0:53b:27ba:2d14 with SMTP id 2adb3069b0e04-53b348c6ef0mr3717324e87.9.1730131792276;
        Mon, 28 Oct 2024 09:09:52 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431935a4b40sm114591685e9.24.2024.10.28.09.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:09:51 -0700 (PDT)
Message-ID: <241d5547-eefb-4616-990a-7da8d8fa4fbc@linaro.org>
Date: Mon, 28 Oct 2024 17:09:50 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] clocksource: mips-gic-timer: Always use cluster
 0 counter as clocksource
To: Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Chao-ying Fu <cfu@wavecomp.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Serge Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <20241019071037.145314-6-arikalo@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241019071037.145314-6-arikalo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/10/2024 09:10, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> In a multi-cluster MIPS system, there are multiple GICs - one in each
> cluster - each of which has its independent counter. The counters in
> each GIC are not synchronized in any way, so they can drift relative
> to one another through the lifetime of the system. This is problematic
> for a clock source which ought to be global.
> 
> Avoid problems by always accessing cluster 0's counter, using
> cross-cluster register access. This adds overhead so it is applied only
> on multi-cluster systems.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> ---


Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

