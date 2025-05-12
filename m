Return-Path: <linux-mips+bounces-8986-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB84AB3A9B
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 16:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A8C3BE1A4
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 14:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6AD1EDA06;
	Mon, 12 May 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C6t4/EmE"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D62AD0B;
	Mon, 12 May 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060150; cv=none; b=c3d+MlXn9M9Uy5LJX2WRlsas8e9StpzclizIJee5uMBoAMQyUrc+++oym8LV8qlSv8bNMB4y/CqpYYwu1FeiJVFZYL65dQhn1WhzVIiBhFj/UNF3k8CcaqFfb2kmh/OHncZ/rdxrExWv9wK5V61CBr/r6+eZPDkLltagN6en9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060150; c=relaxed/simple;
	bh=s25Ld9wvC0TwmKOQJz8UTvGzIPzuSGWY/ZfbRdJ9oig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MQUeKavaL6bK3nFT+mcfCGjAqb46Dp+uj4M9RtHvP38nXmiB2lb8at0kfdeJBLOVutkvwN+Hzsld74evTB1Au8gHNUySUsic7EsaXa7rZpUJP1wiv6Eb5AMrb2DJlRVSq7BSJZ+QHaGr7QWqGUbRECZERABQvlEFS2p6z+fGuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C6t4/EmE; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB5C71FCEC;
	Mon, 12 May 2025 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747060146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JO8FMyqvxtRo7A5Z/7iXBTLAs6G75BYMdiwJxV6g2U=;
	b=C6t4/EmEjYn0Our7hR2cpogHfq1Ae26J+qPfs6SBCrdYYUyEzWWYMx5VNBkqz8t0AGh/Cc
	nWbVZcNda2hCK3AtYJwyHqiq5MIsZJ/SepFTgipgTPBdih3UPT1HEHtSGxlz35OI/z+MM+
	BmhABqguGHzRnVFd+rgNI6bp6Js0WHSZdCE/Y9z20hTn06S8jY2mxemqmeO201iHzsQ3+M
	WKeItsVqcg7CQPRedpCTmLzSdDh4uV6qNHo0zktJYIF/wg68yzaR2raOD9zW9AF9kj2JTs
	JAZ72rqGQz5G6rEKPVPwDpBkR1wZA1VFpge7t4d12akhJotRW/4/b+h9VAuf6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aBSEwag_ducqOwy7@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-Id: <174706014455.62075.9908160461728250420.b4-ty@bootlin.com>
Date: Mon, 12 May 2025 16:29:04 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehri
 hgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 02 May 2025 11:39:29 +0300, Dan Carpenter wrote:
> The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> a negative error code instead.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
      commit: 0d470c72bea4d9f4c24b304fefdc857979cb5ca0

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


