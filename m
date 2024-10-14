Return-Path: <linux-mips+bounces-6022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D103F99BF3D
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 06:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 708FFB218BF
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 04:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFB913B5B4;
	Mon, 14 Oct 2024 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjlbCUai"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25917F48C;
	Mon, 14 Oct 2024 04:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881797; cv=none; b=jf/RRYPy54tJhVaO8xx0qj2RdylHVDSu7PMSmxfWhTrygl6RuJ/5qD2qA6viXE19BqRn5Oo9STN8TWWnRUD1ygaImjgfnopm14A123mvB0P+EqFzD+JDCi+JZ+IqYaTF2ZyspmP6VLjPfjrKvSH24V0u4Opj0cRCpRnarJ42qtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881797; c=relaxed/simple;
	bh=OLmhVg78lcUBnsUQeSffBUaOmoQ0KEXsLEXGRmfRhrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foYZFEP5jWm+bdsM/qjjO0LGZJTtxkudG5CBN1TQ+IIQ0w54lKBILJtlpmduhLTf1E92LoX3gwYCjcmOF5FK4CDPr4QWB1XCl1Ylpv3MtMoJsYPb4BqNGmlEM4spou+k1LfbUQ90OjaO3rR3WiRNXkCdOThMn6t75XVFKAJPmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjlbCUai; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso4146331fa.0;
        Sun, 13 Oct 2024 21:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728881794; x=1729486594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLmhVg78lcUBnsUQeSffBUaOmoQ0KEXsLEXGRmfRhrA=;
        b=HjlbCUaioQ2RqWKVkdeznHjOqV4QFk0Uz/wlOVrpoL5Y7cWiWlmvNnTYbSXChhOrbY
         tkB/V6L1tN5aAzsWT0YJBHB9WNO8fj+ktL6Yho9bNo5LK7RtNW1mdDnFjnOGa0GByQRn
         D4Jxrqid9IY18Uq4aUrNLSaj1DR05MLnjsngIQ01jszA749dWAP7L9uiAS8G40r6SF6X
         zI8LUWHEkbkHu+2ZzavOA5MG9ruzXmxiGLfXdPLonrzlmQuhBe5fODQfwR3VERaCEY1a
         V3FwZvkhDGlV2289Ph8KyRCiX3Q8JrxK40o+12j4O5lqPGtq7IixWki5NknM4j+11xDi
         lWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728881794; x=1729486594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLmhVg78lcUBnsUQeSffBUaOmoQ0KEXsLEXGRmfRhrA=;
        b=bkkqi6ANOLfm3xiiM/wxosQzJnCb6uM6hucHTDFQP05dFGW1mThuViI3e1ifELGaXi
         YP3EjBOi38qHJab2fn4frrmkCYE4LIiayk6oeBFTVOKvq88MwJS7UyiIPqR1LjqVaO0t
         Wo7fhpnm8YKtUI9eMlDOzfI5I+qhbMaETQnEJpSzfPCZWUt5uD3/uOK+tiMGSE4EMpn6
         408rQeX/JfXPjgle/Dtb7jomtea/IQBlVgaOUdI3tbeGHYrNJEZKCNQwce1YxatQhjt/
         0vX/9W5Yyt/wK+cRkte2NJ2xQP6Oz2CL6P3wP2cPosuKHusc6nPsw+j8uPZVdGBdw6da
         olog==
X-Forwarded-Encrypted: i=1; AJvYcCVAfjzXOjT2egM1GWw7lfjxqYi1zoAY1yumgq+0LbbUx8c8r0MmZ6jSScUNXygHdtfDqnA6ZnO6XxgV@vger.kernel.org, AJvYcCVCC1LYF+loXI49R50QSTiwooKhxxrI8uGEcgAEws86je3Aqg9QTPksYbe1bLJuoa+EZM1ayCAdS43GTBxT@vger.kernel.org, AJvYcCXFt2cw8GKLGjYkcHg7lJ61mHEJZCowNBG7EexKGghFSk6NgQBIFp9p1n7OYt4T6UlmnbsAvuGeFpcCbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uU23qtITjZXdfO2jyu5VUbxHCXjdG/WRsk+U5mXZWCQz2R93
	3ptl4gH1lqNB0snkJ1I5fwkMwaVJJ+qPuGreicHFmX5qHIJXsb6d
X-Google-Smtp-Source: AGHT+IE54gXcv3a4S2J6AbtS8itW3hdrWOeULbQ9UDBITrRp2ibiZ9Cfzvn2bTKHXF3J+p3FzMJLHg==
X-Received: by 2002:a05:651c:549:b0:2fa:bad7:70fc with SMTP id 38308e7fff4ca-2fb3f2d1691mr24724481fa.29.1728881793397;
        Sun, 13 Oct 2024 21:56:33 -0700 (PDT)
Received: from matsievskiysv ([94.141.107.74])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb4bca8cf3sm3878411fa.139.2024.10.13.21.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 21:56:32 -0700 (PDT)
Date: Mon, 14 Oct 2024 07:56:29 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com,
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com,
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v2 1/1] pinctrl: ocelot: fix system hang on level based
 interrupts
Message-ID: <ZwykfY7iP-xXgsY8@matsievskiysv>
References: <20241012105743.12450-1-matsievskiysv@gmail.com>
 <20241012105743.12450-2-matsievskiysv@gmail.com>
 <CACRpkdbCVFEgP3ZchLtM8KgDVVbCiK7ZgGha=iVfTBveRstDkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbCVFEgP3ZchLtM8KgDVVbCiK7ZgGha=iVfTBveRstDkA@mail.gmail.com>

On Sat, Oct 12, 2024 at 10:04:30PM +0200, Linus Walleij wrote:
> Patch applied and tagged for stable!

Awesome, thanks!

--
Sergey Matsievskiy

