Return-Path: <linux-mips+bounces-4664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEBC9456E9
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 06:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F0E1F242D2
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 04:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7576A79E5;
	Fri,  2 Aug 2024 04:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=main.intartek.com header.i=@main.intartek.com header.b="B6Muy7i6"
X-Original-To: linux-mips@vger.kernel.org
Received: from intartek.com (intartek.com [185.20.185.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EE8836
	for <linux-mips@vger.kernel.org>; Fri,  2 Aug 2024 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.20.185.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572475; cv=none; b=OHuxY1GSEYLQQ8wqp87GphfrgRlXq/IUGtAHkZmFyK2bEZmC/woF6htd+v615sdDeFSH5kYpAy/M7c6DLH3Jd7DmZS4IRGWG7D5+ZKzSrF1+u75p0qG9MYYummg3Mw/fdLrErQ4lCtZp45FLFNYf2rAu7ETgFyDb/O7jPtWN9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572475; c=relaxed/simple;
	bh=96lO3Tr32xIrDU9siv4iJDuv2xWTOnq9LBI/2/XjF2Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cin/9e7mPWTZR9R6wNKzm59tLMB/6MCkCwcXvTtd4A1j4FlV5R55dolad5eVlHqqcFgX0ntncDTSl5bWnw18pvazJmDlNEd9gQqQWYUewwVFERXaJ3xGhM+pxPpuZGrRhyuwgZ6DF45T2LCwEMOGLM1qwQpIfSabSw0+Ta9AkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=main.intartek.com; spf=pass smtp.mailfrom=main.intartek.com; dkim=pass (2048-bit key) header.d=main.intartek.com header.i=@main.intartek.com header.b=B6Muy7i6; arc=none smtp.client-ip=185.20.185.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=main.intartek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=main.intartek.com
Received: from 239.32.165.34.bc.googleusercontent.com (239.32.165.34.bc.googleusercontent.com [34.165.32.239])
	by intartek.com (Postfix) with ESMTPA id A71918210B
	for <linux-mips@vger.kernel.org>; Fri,  2 Aug 2024 04:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=main.intartek.com;
	s=202406; t=1722572400;
	bh=96lO3Tr32xIrDU9siv4iJDuv2xWTOnq9LBI/2/XjF2Q=;
	h=Reply-To:From:To:Subject:Date:From;
	b=B6Muy7i6iybkXWU3EJd7UeGgUtOU15iGPUvSiFfwAJ2+3dVOr5ta718jVkQwci80K
	 bq525C9Oh17aTkcZOG2o6WgZI5ZS+g4WURehxTIepp0I+B3yf5pd8648qDzBbSM+HM
	 VsI+dyy9QbL/maL7NkI2gv2i0LhwhAFpkkoqAifTFB0V46tT+dIj2/TZSfunjuYbjj
	 DZsPTb4ZWvKNCA9oVaG3BKQmPuHpmqyqq4KD4D5yUPKgG+4/GuifNn+GWY1ehD4MP5
	 eNbyuQgrk9MJHbsHy/Z2o2ClXCJNId+OKRf8QIG08vHRK+pglV+gKqOlXHBIdxo3EH
	 PA6vg3RTpp8Jg==
Reply-To: "Antonov|DPR" <antonov@neftelensk.su>
From: "Antonov|DPR" <privateservices@main.intartek.com>
To: linux-mips@vger.kernel.org
Subject: Kazakhstan Crude Oil Product Offer REF:hrdpvq01
Date: 2 Aug 2024 04:20:00 +0000
Message-ID: <20240802042000.DD9EDFF73B1C4271@main.intartek.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear linux-mips,

I hope this message finds you well. My name is Antonov, and I am=20
a sales representative authorized by leading refineries in=20
Kazakhstan to negotiate the sale of crude oil products worldwide.

If you are interested in purchasing crude oil products, we can=20
facilitate the process. The refinery has sufficient product=20
allocation to supply to serious buyers.

We currently offer a range of products including Petcoke, Ultra-
Low Sulphur Diesel, East Siberia-Pacific Ocean (ESPO) Blend,=20
Russian Light Cycle Oil (LCO), LNG, LPG, Jet Fuel, and more. All=20
our products meet SGS and GOST-R standards, and we guarantee=20
timely delivery.

Thank you for your attention. I look forward to your response and=20
to discussing further details.

Best regards,=20=20
Antonov

Message REF1: cnpehpp02Q
Message Timestamp: 8/2/2024 4:20:00 a.m.

