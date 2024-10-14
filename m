Return-Path: <linux-mips+bounces-6023-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A073F99BF49
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 07:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7E9282E95
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 05:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8BE84A2F;
	Mon, 14 Oct 2024 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0VQQlqG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAD4503C;
	Mon, 14 Oct 2024 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728882395; cv=none; b=sLd4/IaaTxWf4A779tP+9s+eXToDy0qBTlqN/BPhrIkge1AeZwyIpiTXdVcCpW7t6zY0EXMZ3riCcrbpHrr0SNx19z3u9sMS0GlEBM5D9AOXijdROaSsiN/2genCCfXFwiGpNP/tc9/vVhrhOeNQI//GX02KUJPVH0/mZ4oPRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728882395; c=relaxed/simple;
	bh=EDcDse/sPCt+KZEANdYmr26F4qdBfzS1C9wf1zdnpHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvbAS0zyvx4AZ5D5bhAWIdTW7HVHrOaoxcHDEQ3cgMtSMT2yPvbItkpO+GFC6nwF+UqV8zvlSOUukGWyDohaK8/HYYx7Rtc1+PJWNUOP/Kod84PmGJDvd2dmX0ZfO/fvaN+DJPT2Suxlv5NbvsUPOetjXcfTA7hA+dG4WmToIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0VQQlqG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1060545e87.2;
        Sun, 13 Oct 2024 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728882392; x=1729487192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDcDse/sPCt+KZEANdYmr26F4qdBfzS1C9wf1zdnpHc=;
        b=H0VQQlqGyu08bXLSTBrMobGVRjXtr2/Plv8nYhgcMq4o5bFtiFZf1Mmd/Axwd8e9e5
         +dURFZldat7de19HFR/awTFDWpyU7bQiwBFswoxo4ZEdl+EScf6B/6xQQOb0qhAfY/c1
         TfbomATKNQuACQCOo13/+ZBrr+/8jVog/6KTLw+2FqmN2N3ZaIubrM6rkxrOzGVMSA92
         SZK20YGdCuD2FHacvSSw1MNLhzKppv1qvpHuZjP2qgBis2reIojOwMBaybB0qTNopQqK
         abimbdFbgy6WidFcatRNaFQKRnm15VZDCFMba8lQvZ783sYmVLcNo2Wf5SCvi96WAIRg
         456Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728882392; x=1729487192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDcDse/sPCt+KZEANdYmr26F4qdBfzS1C9wf1zdnpHc=;
        b=S1SozVBGo0sj9rM35CO/cfvMsqgeZs8UlPgkL0en+Rsn1apv7xSObONa6EWRrwN/3/
         SvI0AmbYeqKeUJk4Ox9EEeaHZtkXjDxLE5XU1zLy1cyH2fChgYYW61iV6cxXbjnaOHG+
         yI2oNrqTTs0UHSCxc5j2qKcRSfM0657wgLuBfjneeXhfO+B4P0CjGzpSU71Fqk6oj0tt
         6cF6jZ3WWJ/dpvti/SdLxavrt7T5oBP/8evvhA1tEeqZFPoiYjMQ0CsAfEO0YF+5LHox
         C18POaQQCaFNDQLSYvLJIErirBcddpfCbnPdKcqmKQZr7BJFOmzAtOIaxaUCF7N1hLlS
         KrLw==
X-Forwarded-Encrypted: i=1; AJvYcCUka40y6V5/6y0JDyI6DZhj8zgDaNASKKwQq3277at9KsJr2Nv5do1kUfcKZMy8yW/25s7hQSCMDLZd@vger.kernel.org, AJvYcCW3dWyznkDi6/1C4ISqq8IbDEr9I2BJGEi/Slv/yienXl1vSZkJc+zqEG23hYlOyK827HVA9/2XAI8DjQ==@vger.kernel.org, AJvYcCWLpds7TM5QHt9jjcPP7AH2FaL01674ZfMLZIQeADD2FbCfss1VhU1z8sAqzUVzXy8HrBBZIYrirFkZJRl4@vger.kernel.org
X-Gm-Message-State: AOJu0YwwE5+0vy7YYAP5oQfgbEvlHs4oN8C/k+lvIZd7kZFHvfCw5mEY
	rqb5ERYRfQtwV6xxlCd8Di58FhIMPXJ9dc5hOZCyoGJpEWWZ14eDhd7pCuRj
X-Google-Smtp-Source: AGHT+IEUCm7LwOrks3pn0mpaIFct8gaMDMOqCuTUjeFblKsYFUkX4orxeo2Jp1VlFxjFqY38I1XO+w==
X-Received: by 2002:a05:6512:1153:b0:536:a533:c03a with SMTP id 2adb3069b0e04-539e54e81a9mr2192428e87.17.1728882391567;
        Sun, 13 Oct 2024 22:06:31 -0700 (PDT)
Received: from matsievskiysv ([94.141.107.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ddf85cf4sm1106451e87.68.2024.10.13.22.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 22:06:30 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:06:28 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linus.walleij@linaro.org, alexandre.belloni@bootlin.com,
	quentin.schulz@bootlin.com, lars.povlsen@microchip.com,
	horatiu.vultur@microchip.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v2 1/1] pinctrl: ocelot: fix system hang on level based
 interrupts
Message-ID: <Zwym1DARa2UNbVcO@matsievskiysv>
References: <20241012105743.12450-1-matsievskiysv@gmail.com>
 <20241012105743.12450-2-matsievskiysv@gmail.com>
 <ZwwaWLT_A8LoVsbl@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwwaWLT_A8LoVsbl@smile.fi.intel.com>

On Sun, Oct 13, 2024 at 10:07:04PM +0300, Andy Shevchenko wrote:
> Side note: `git grep ...` is much much faster if you have a Git tree at hand.

Thanks for the tip! I usually use ripgrep, but git grep has some interesting
features.

