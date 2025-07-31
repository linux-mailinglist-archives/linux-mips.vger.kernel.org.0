Return-Path: <linux-mips+bounces-9963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6BB1750B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 18:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26512189FCB5
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 16:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395FB1D799D;
	Thu, 31 Jul 2025 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="vqWhnkt9"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB74689;
	Thu, 31 Jul 2025 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979830; cv=none; b=D9ugm4Z0jG9eekGhHsu4h3RocS5V6L6D580IbhHJOVtLE5rJeS4ReUSnvom2R9Y6779JE7Jvf5JuKpBpigPm5rtEXEmhdApPF6IcJTSKAaspnCieEcW+Ok47cFTUz3XXeV613VEh0FAtQIwVLgWbY+ILrGAtEzEpfrlslnuSfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979830; c=relaxed/simple;
	bh=iMyLWn4xbbLFduPW7PCg7w7Kn/RYDJMqdrHEONbWu9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amJPjgsKJzVJyE6b/igLiMC4NS7h4XPaFsD8p4nm81KOjyQ8u5bKY3L0YkixzmOQegZFJo2Iho5rvXsEUG3t1Xl+FV5FAFbRGREbBuXEB1py56GxMUzzOgksRBMDUG+EXpJi9lyjtOQwcTqa2+6J6chUuQbLtAe7B+Y5cMQFwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=vqWhnkt9; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 11E07C000337;
	Thu, 31 Jul 2025 09:37:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 11E07C000337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753979822;
	bh=iMyLWn4xbbLFduPW7PCg7w7Kn/RYDJMqdrHEONbWu9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vqWhnkt9rgwOxt/NeHdQPuEVG0lRH6otwXRHMZxp5t0eshyziCsXp7ab/ZE0gPOF5
	 HZMa8mURNxbmNpqZd6OIckCReockD7iu0RSPqpQMYj1czKfuVgWVZIAUYBNY7EhJGk
	 K8PAANZ+23QdFVl+j8Cxsg0QY1SBmNnzyYsI0O3s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D413E18000530;
	Thu, 31 Jul 2025 09:37:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	zajec5@gmail.com
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de,
	akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] drivers: firmware: bcm47xx_sprom: fix spelling
Date: Thu, 31 Jul 2025 09:37:01 -0700
Message-ID: <20250731163701.3509061-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aHt+Ey5AQ0dsCuB4@bhairav-test.ee.iitb.ac.in>
References: <aHt+Ey5AQ0dsCuB4@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 19 Jul 2025 16:44:27 +0530, Akhilesh Patil <akhilesh@ee.iitb.ac.in> wrote:
> Fix spelling in bcm47xx_sprom.c as follows,
> specififc --> specific
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

