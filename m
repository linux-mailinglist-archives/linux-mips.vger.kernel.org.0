Return-Path: <linux-mips+bounces-9856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2EB09D31
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 09:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F8F27B8648
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 07:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4FA29CB5A;
	Fri, 18 Jul 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LmK9Wy/v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257F2BCF67
	for <linux-mips@vger.kernel.org>; Fri, 18 Jul 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825397; cv=none; b=NOLfGITBJShHzrIYkvLcqMOryekG0fdw3qbputxPoYGC6CxCdw5metoRBJeIVXa4c6N6I4YGkqQ75ifc84MR+O6tNrUpeWOehzmuG3bKKoJ5F+FN/m4A+pTkAn6HYhvnohessshYh6a6wmfjlI7rdmh9rZF4yU9XujF/KsoeJJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825397; c=relaxed/simple;
	bh=PwuTsPsOI9bcEcs74QRkQaUqtP5pEnUywVzKLkjeu0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvI3g4CdNuGsYDI97wJFH86GSxePgv4s2hLj3hzPMaX3LGEiJWsS797XvwdaSJpLG4Pr5zg8TVVHWbYmRV2eo5s6XKHRQBLRrkOZa9vagub/bsY/qUOsYN79T4unLCZ9i1s0onzMbVMwtDf2yxwClln5mcI/ki69loOsY7JNsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LmK9Wy/v; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f379662cso1332508f8f.0
        for <linux-mips@vger.kernel.org>; Fri, 18 Jul 2025 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825393; x=1753430193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=LmK9Wy/vWSfdoQaFT8qg83f4PRZFbiHGkso/yZKVBgPP4PaEBTqm7Uf65DSPCkjne6
         oiocn+uJ/AbMPNUGCPhlD+Gbtho83/Zv9mb9EroK5/eZMDNIUJc6atRBPllWHmHypLpB
         kzTy5nvTWMy2iZwOTIwQ2ARXB9vLCQkfzSpdY6kFjRU8RH/9BQ3PgwmVp/ANXpHkcf97
         G5OjlImsCBQ6tSWaYW5WPyV5KSEI7fg+5Dv7H4PXmEtfn1xX8fLgOUeO2i1Ymrv0I1YH
         Kw6msFj+m7684x2Lpvbe8mzNxUD5tPzpM3/20b1Lqgzghil2rpzQz5zey0e9G29M82Fn
         bEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825393; x=1753430193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=iwHdK9hsucmiTMISLyp+inFJSPWSfBdnRJwnA1xJyAFv+IS7GPGP4fODrp0IRBFnAj
         vSndChsl6TvgtX/JGZe6W32vne61lxL8/l2a6mllz/W472y5ynZR3zsTPHW1pjw/Jpt6
         RkTFB9mjv7M2RSvOTuBu6untmBWWTGWHFydTw45fgCjJTQCBCEGNxzk2M4wvJxtSgGdk
         eQqD19xMgv1rxL177PGyDplvl96nyslcHh4G8CDWjiCjZYEQq4HIGBh6+aEnWvjMpnn0
         mlrXh4CIVGdvjN+gdKuZcTat/ur9iXtgb+qEKQrbBkU8f34e9qF/mCzT2CPy6PUWdFev
         baaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPtNNkKa+masCfE1/mQk8cz+XpXyK/JgPwyULkB95tyX0ifnfvtyd89oY85COAoGHYc4cFSd7xln5p@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9nIAwitLnPmJOivLuhn57WwzsZ7GJACpBO3a7OnVTLCuIPJi
	l1lTIsXABI9tZHBBKH62YVtgP7LYquH2zGlA/lSMDYGnUFmPaBR2JPVD+Tt+gJO+9jw=
X-Gm-Gg: ASbGncsm1S+ju/Y1M84PoqPlY5ZnzaWnTUieAYdWsOWz9OpXvqxxdmX74/j+e4PEKXf
	FMbp3iR2mpgu0UcOxThcUsl/CPrZFG4qhJtymsRsXMhFqUxjq6E64VX4LRqa2rPkahq8CXROKLX
	9BWH9kdE5ApCL3ZV8L8euMS9wCgVa03u3qh+58RvhSA2FNIO/qlq/XIuxQcB/G26Cy+fUMgXex9
	7/95PN2gPUds+T+vwyHY1LkOSnKYNwOg52yEAhfpeOF2ZXRpI4W8b0xCFIheP73c1QiRCVqb/EZ
	8j0WQtKkMzGxo4w0Pc3nIV4oGkUy1Xg57RP2nxw0OwtEh9H8A05+sSCmdc34M+gWYOt2PcZJZBW
	ocLo3bgCowPF51uaXwU15
X-Google-Smtp-Source: AGHT+IFR7z0xrtW7kV+L/PWsVn19Mve34KO13llGmq0De9UTBvi6IEowVSVAnjHLfBTTi45HhGu+EQ==
X-Received: by 2002:a05:6000:1a85:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b60e4f2c6amr7520566f8f.38.1752825392621;
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Date: Fri, 18 Jul 2025 09:56:01 +0200
Message-ID: <175282531516.45055.8482528409833116992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
References: <20250714201959.2983482-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:19:51 -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Create a trivial GPIO schema
      https://git.kernel.org/brgl/linux/c/2ace85b5bbd065a4e037970154854dc2b41d7b31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

