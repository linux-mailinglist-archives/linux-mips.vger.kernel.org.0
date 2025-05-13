Return-Path: <linux-mips+bounces-9002-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E252DAB5705
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 16:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C169189B349
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7502BD017;
	Tue, 13 May 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbbiUOd0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C394F292080
	for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146297; cv=none; b=NW7J1gvZAz6VhZOWBKHLeLEy8S+ymFZhuLzMU55L8YQVta/wLHrIYhr2NT0fPHmOdqO9JxzOWJg0lUd347LX7uc8VdcBthTyV/gCwPsp/eNcTfMIy5Mv6DJcD6miCQpYjqR8Fl0ZV7NF3uNNKyoyUu8Pg/I5+K75NsAOO1o6D/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146297; c=relaxed/simple;
	bh=GxwcSYNe2p0XJBrJx4bSenouSf2vBwH0LKTpfUMyLn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4jF+zKd+gP1Pv/kf4jKpy8wERMchJAfaLiTOvC88POcpHgC5j45b+7FxnYYTA/KwtBysG0P3Ms/mylvdeIIus2m3jihoBVDcMH1k0NwjkgsGypoit74jmq4rOIGSI+OFJJ1sjYOUFrBCK3m3xpFUFEPdy0o0Gv1OO83SJqGF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbbiUOd0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so41259695e9.1
        for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146294; x=1747751094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=GbbiUOd0zktufQFK9LZO0f6IqfSKNNyks3R+IYGWOLbDrfHJeJ3WqDzARkp3llsvLB
         iL1wnox3ggk7x9CUZXYGf5iNRZFT4qf3BvPxOFwWWoKLTXBpwF14g/iyI6oQ2McqM3xf
         jMXov9f1UtvHF6v9DCYlbrZmOOpPHPiuZ3lDa439MgtgDTD1KgHkp9lrJCAlLcXHyAVz
         2HdpIcPVmWIOc+thpXTvBmqKxgHl8NCby9wHY7vQhsHf8S4Xw9zdE+ztu8Fuf7LvMLZS
         /MSnKxyLDv8XxtytFJ4l4wwM/YibtWaVobNTnkB9d0gzZguceEaSuKubnrLJ/H54bmNC
         mT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146294; x=1747751094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=X1eOVCWTcRBK17Uwb3P3IgxS5N5ehR9zvZc8Awb8oL3Ol9BZJHLeihTfu6/boblvAS
         NEmoAuLgKCg5Oqk4sCvH7tcE1JUG8tmsmKod7hQ64Q+TMTAjsOFZIFaVVZeW9t1D5Xul
         Qxg76fN98GtpreQVsD1Vy8+/pNYIpV5iMLZERO4lXdjVI3QhKXsHTshaTcXyH4+EdLtv
         3gEzUN7SbSPk7q+oaYpjGAyeHbdaXJB0t+qeiX+BNV3ic0YBXWBro2MNG2kKm9nKrRhp
         Jx2lf73Wr7GRZd62KS66qYy67mHQVgtdjtGWApwAOycSyR+GQPf0AudZb0DvGEBx4ghN
         Sodg==
X-Gm-Message-State: AOJu0YyzPn3lCAOif8eEMyRxHHdkmvjj5R8bNWow15fFf5zRko1Z824B
	zt0RUoMNVYSjTCkoYATSMSj1eBeZO/OBcpNpHZe+TuN8UXFMDjBa4g5h62dfphc=
X-Gm-Gg: ASbGncv0J5ogR2Cam37Ho3lyrGhXiYQeMTNG7hSG6tdmeelqywp+TniKBbyC4RZhfW7
	PsxRlLVD3h83TijTrd8vbFGH4Ghg/1geJ4D5NDEZg0E4BjKGx6gAkXdRsxsqusZvf1m4h6rKfaX
	11TC/T+ropMdwx+WIRXvQrXLOTw6ScD5Rc+09QBiboZqrgcYqnr1MTZJhv5WmJLN2V82YEZburv
	CMPx0uBlKepG9m08JOuCtzu8/d5dt+JjGzilmgb3vWYdVbqdIP4UXof5oPhKBpiuxO4F29Oixdw
	Y25sMg9g09aLhLSYo7Tsm1IuLj1Gx1BQuYlaXPodMOyW+c0Ouzk76aEZknowaHuxV9Eqd9NpBtW
	T+pmC2niWPc2nVQ==
X-Google-Smtp-Source: AGHT+IHHlX9t4nfJ+7hHMCJoNaC1yXBW+lGGwra9RnsLEfJITmGfdfvMv/X1F4SEEmKSiUDfR77dIg==
X-Received: by 2002:a05:600c:4e44:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-442d6d6b603mr171874205e9.19.1747146293972;
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm23697575e9.18.2025.05.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Date: Tue, 13 May 2025 16:24:51 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>

On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> processors. They are found in xDSL and xPON modems, and contain PCM
> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> 
> The EcoNet MIPS SoCs are divided broadly into two families, the
> EN751221 family based on the 34Kc, and the EN751627 family based on
> the 1004Kc. Individual SoCs within a family are very similar, only
> with different peripherals.
> 
> This patchset adds basic "boots to a console" support for the EN751221
> family and adds SmartFiber XP8421-B, a low cost commercially available
> board that is useful for testing and development.
> 
> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> peripherals, and for historical reasons Airoha chips are sometimes
> referred to with the EN75xx prefix. However this is a different
> platform because Airoha chips are ARM based.
> 
> This patchset is against mips-next.
> 
> v4 -> v5
> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>   * Improve explanation of HPT timer in changelog
>   * Move pr_info to pr_debug per recommendation
>   * Remove pointless debug on spurious interrupt
>   * Small code-style change

Shall I pick the clocksource + bindings changes through my tree ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

