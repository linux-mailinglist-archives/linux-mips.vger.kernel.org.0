Return-Path: <linux-mips+bounces-9004-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA36AB588B
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 17:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4EE11883E64
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 15:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE452BCF4B;
	Tue, 13 May 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTbJ858B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8227056C
	for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149982; cv=none; b=SkVdTz81VUtu2Lx+7lrDoZdp/wtE8po8o9lNMdDY7RGpV4XLBqUkXSuid70a79lJ4WfCbXZYqb7Al7HvFP+Nt8GftC7sRAyFWvSearQBHyT4p/5UvJsoteLgcJWD9IHgY7Ns1XERJkWklUeGDvYCF2zlNkdwAmTDM1aQ0KyDcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149982; c=relaxed/simple;
	bh=oSLfTwOfebog646sA1mZSi8+62TCjVHZ4DLwUTc/jjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcFiTpUikjH7qUYalXQNlZsPZYPJ3Cws3QoRIgUOFFRjFHuGbF7/rXF1rPwCDRfJOCPsE1XXx2xeswGVFF2DBC7RTqpxPxAP0RMKogAfTypVVsy+LPpi0R63rZ7UQAaGljNT1XX+tEgCs1R3EpUY2hV69XefWFQwKabvpQ3sV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTbJ858B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so66268115e9.3
        for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747149979; x=1747754779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=KTbJ858BOYYlAm2Z/Ut9+WgmqNdrcWVhkBAscfNvhMAmph5LaQA4GOlDmAQJOhIYMF
         mXnmNlDQoz9CVQfGKRsIrfGBkHclroK4WQgJyeF6cxYtHzPCusCi8oB3xNW8sQTd2RII
         tPdhxP51LvYwt4fPYIteAe/xBRE5iv/AedU3eu4qJo0XZaijj3IgDAKQTkDtrQyljU+3
         Jx/cCDtghfjj+qJQe+7Bs4klp1dK3bzYF2SUHnCEbVTMm0nnquloUJgqTqCO1lpzBvn/
         yhoMKltDO6aNRb824GvTZbwC299w1OfOanyZp9Tjfbs+OrhTJG/BPVmAwwq4fUyILsDy
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149979; x=1747754779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=kwrPQzZ+j2Jsw3pSa+Y3Ez8nSAQD9Y7P+Y9q/PUZKer6xENxmMSwtdI6IxUWrBkFB+
         yjlQ/wWapt/2n5bP2/EtA/bgfjoAJ9hdMRlfaECQlraeq0Kd1Gbvwp3vhdQfzI9zsJ17
         xXS994OA8vphGnccD/6RNKAX9fgJuEXkJ6sx/5Kv5fgY4e3K8m3GHnrEC9jDLOr0v9fU
         nbYRXMNyeyeWJpexeGrTh2Z20Q4xhwJhrjeide24UQQs6N9Efq/rowURLv1SyAZ1aekF
         yuImvIA/8BU9344M7HGIDgxHmdHVoQidSDHa56j1C3fz9+vmQpqmosFeX1NRHfAqEG7n
         mteQ==
X-Gm-Message-State: AOJu0Yw5DsfHQReG0FU6w6UwHEAnR+ZpwapM3vq8c/xekifIG4k2S1mk
	iNH/3ZybykX0K2pxtup3fgalnHr01jji2yXcuEdDPYUexVdO90ZxezFWOIkkv7g=
X-Gm-Gg: ASbGncso0/VquEAEfJUJferILwADPVEl/llvl+zAGlXJSlR+mwltj/hJg3vExbJsg6f
	aiuK6+Y2RvucT4MeIaxWlnqiqFiLTTsBGz7ukiUBt0f+XiND3fKXmI+swJgYIf5j+7NMvW0fGye
	ZbygV8mtonGIdiI54RCxNDiHhMJDEPWKjnjlEjM51FR6djmuDHfjIB4dOQSJ9rXUGeKNo6dCgeM
	88DL9IX/Uevu29DWt+P5W6xaCn/FryWqYBL5K9mOsg0bH0ZFh0SiUq0f1UYrHApVndRb3HdQTBM
	TP+4lqBLDIxj+9YLBAlr4Tpi6NvSJNcyVG2HYK5P01cNkdnxqrVOf02nUUKi//mpubVw0VHqT1o
	sCC/VfgksOQ/BmQ==
X-Google-Smtp-Source: AGHT+IHATfn9TRTLOTAhavKu9D+jbJzqaZe2/6qO1pPzjKVbpE+un6V0tEdk13nda5FV4+6YBmrqUA==
X-Received: by 2002:a05:600c:34d5:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442d6d3e243mr178053375e9.10.1747149978722;
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm167068485e9.33.2025.05.13.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Date: Tue, 13 May 2025 17:26:16 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNkmCJK1wOLGmgy@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
 <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>

On Tue, May 13, 2025 at 04:31:05PM +0200, Caleb James DeLisle wrote:
> 
> On 13/05/2025 16:24, Daniel Lezcano wrote:
> > On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> > > EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> > > processors. They are found in xDSL and xPON modems, and contain PCM
> > > (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> > > 
> > > The EcoNet MIPS SoCs are divided broadly into two families, the
> > > EN751221 family based on the 34Kc, and the EN751627 family based on
> > > the 1004Kc. Individual SoCs within a family are very similar, only
> > > with different peripherals.
> > > 
> > > This patchset adds basic "boots to a console" support for the EN751221
> > > family and adds SmartFiber XP8421-B, a low cost commercially available
> > > board that is useful for testing and development.
> > > 
> > > Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> > > peripherals, and for historical reasons Airoha chips are sometimes
> > > referred to with the EN75xx prefix. However this is a different
> > > platform because Airoha chips are ARM based.
> > > 
> > > This patchset is against mips-next.
> > > 
> > > v4 -> v5
> > > * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
> > >    * Improve explanation of HPT timer in changelog
> > >    * Move pr_info to pr_debug per recommendation
> > >    * Remove pointless debug on spurious interrupt
> > >    * Small code-style change
> > Shall I pick the clocksource + bindings changes through my tree ?
> > 
> I'm new here so I don't know what that means for the merges which
> will happen later, but I don't see any reason to do otherwise.

The series introduces a new platform. The patches are touching
different susystems managed by different maintainers.

Usually, the changes are per subsystem, except when they are
interdependant.

Here you can choose to merge all the patches through the mips tree or
let the different maintainers to pick the changes related to the
subsystems they handle. You should clarify that in the cover
letter. If you choose the first alternative, then before merging the
changes, all maintainer should have blessed the patches with their
acked-by.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

