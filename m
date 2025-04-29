Return-Path: <linux-mips+bounces-8866-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526AAA0701
	for <lists+linux-mips@lfdr.de>; Tue, 29 Apr 2025 11:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC25189669F
	for <lists+linux-mips@lfdr.de>; Tue, 29 Apr 2025 09:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653029DB7B;
	Tue, 29 Apr 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lwQmXdwa"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DC2AEE1;
	Tue, 29 Apr 2025 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918663; cv=none; b=DWYZEQIShLsP/+5L8SkMgGyMEVSJjVvbVoCduNfUxc/5tIj+JmjfEh7S+yjR45g0UdO3UP2LwDu19b9EF5FdE4RuI/Q34w4gNk0D1oGA27RHYn1y1Wc+l9xDOKOq+PugQXptPOBDKn/yFFnUs/qijQkc1rp2WGZsadQ+cy/bhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918663; c=relaxed/simple;
	bh=v/1PWZDE9LhvYVzvh4nbkMKW/Yz9R0EAlITfjRWJ6aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=emL7FbiM/Hx42rhYR3s4kfsmBYLg0ZQ+oTy5lWtxngUOnF5fa31aIrN8wjLSWV5QK+1HiCjcPcL35g84HNnms9bu3MuINDjxuyUyfRJqyAsxkEquHQsPWCgY0PTFC5Xwx5bDrGguBw6tJBXkZWzrxaDti29cHAfs2jHp+BHK+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lwQmXdwa; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F5481FCE7;
	Tue, 29 Apr 2025 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEZ0/TGAvSoNsUalpNLb8aLo8LMMcOANkTCZwKQ6Zkk=;
	b=lwQmXdwaoauJ6hEcJAvn5jgXfWSB3TfZJZ9U+eEaK7Veri0FeQAOuFpHyHe3NbnvI5r80G
	FCuKeZSaabwYzvgSsKSspZzQZ/Ly1PnLR53+yfA2zYaB8j4tWsGZFJ341nI+XcS96jSHmL
	Lju6igRcOH72VNzulesEfHI3r0exkCo+Whx0vTEX31FDAsJTbz/buG5uCViioezGPxFaLc
	xDWiZYGqzPNsWKlbxci8IP6bSUw+rJvr2Xdnv8Md16zoqfJ5OOo+dXQyyYlsMd/W5rC2J+
	j09uDMcXydNFRORaDYOu1Tw+mfMDxXo32FWlxN+Vd0kdsNLAArZoAH4czRkCuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
References: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
Subject: Re: [PATCH v14 0/2] Add support for Loongson-1 NAND
Message-Id: <174591865038.993381.4352536787925323902.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:24:10 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieelgfehtdejteduhffhvdduueetfeettdejfeehkeetiefhgfevhfeuheffleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 20 Mar 2025 18:31:36 +0800, Keguang Zhang wrote:
> Add the driver and dt-binding document for Loongson-1 NAND.
> 
> Changes in v14:
> - Clean up unnecessary print messages in the driver.
> - Some minor related adjustments.
> - Link to v13: https://lore.kernel.org/r/20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com
> 
> [...]

Applied to nand/next, thanks!

[1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
      commit: eff4e04c892774b1cf7ce43afbb186ff0be870c0
[2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
      commit: d2d10ede04b1671dc4762479a2d06f183aaafbba

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


