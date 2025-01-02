Return-Path: <linux-mips+bounces-7225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDE9FFC66
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 17:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB6297A1B21
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 16:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EED71547C0;
	Thu,  2 Jan 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="kKgm3rMv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5236E1F16B;
	Thu,  2 Jan 2025 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735836870; cv=none; b=JKdLBmsKRe0bgf+yl8nprzUBWwrQcFSmYI9Mze5B8bpkFTLXRGjTT33LTPaH9IYgmh/UNuGz5OaHi2la3TONnLrE79SZcLk2Itq1wSoog4i+h5elLzJTSeNA2SyK6F3+oRW5CL6PuJP2Y41chS7LSk1uQv3GhLs9EZUf00WOpiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735836870; c=relaxed/simple;
	bh=WKBhCnvtMIY0gTCieqrMhUbL9KKmSsXX0ThPSNaPwls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txXqFDXgXhjE4/OgE4XT0h2Okjr/96FnMynmIoTUGoOztgRHXsH4TR5OTvMEXnXG0VkldQBEoBOY53Kjp4oFuKk2hE2hXctHZ0//x/f0fGBDGv4c9tC/tykD9SR8zNRaeLMg7gNO1JWccNDF8Rw7Bhfoj6U3gioE8x43oEh1zMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=kKgm3rMv; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1735836823;
	bh=MGRV4JGUlwRUQzrhpkSdmx2FoinaZwX3vwgwN4+ubic=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kKgm3rMvViCUwIdsVeFZnzBhSk+uQ8gnb0jmNueSavcjt0WEU0VawPd4z0cKOVQAc
	 Ip/cNYwVssmBIPSQN2Jfq98a2MnCrMuw5UyHYUIRUVUC3E4/CpmiMaTV/6EgOioZKn
	 XWcwaJrrA8aMy1jyTBnBpJQhwa4z/e3c/ryG3zHQ=
X-QQ-mid: bizesmtpip2t1735836780t05d0rc
X-QQ-Originating-IP: 7Ti20rk5NQiroZTWd+ILbIe3fPVqsLzx1brMy7bfJNI=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jan 2025 00:52:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7390309620555676409
From: WangYuli <wangyuli@uniontech.com>
To: macro@orcam.me.uk
Cc: baimingcong@uniontech.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	revy@deepin.org,
	sashal@kernel.org,
	stable@vger.kernel.org,
	tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	chenhuacai@kernel.org
Subject: Re: Re: [PATCH 5.4~6.6] MIPS: Probe toolchain support of -msym32
Date: Fri,  3 Jan 2025 00:52:58 +0800
Message-ID: <8AC8E4D8519CF8E4+20250102165258.57525-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <alpine.DEB.2.21.2501020550110.20821@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2501020550110.20821@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mf+wQkWJ2TuYBMzfbZT7ecSDB0dI4ood/OxEkTzSJHLy1N6AsQiOX2XQ
	xy22vrjWCuWCRIZehXizuyIZwLrIkXOrtYoRNxnOuEnYjLcpbXcYoSrmHGbv3nP5Jnje7/y
	bUNMZi1vPKftMy7TyY5DZVHvRYmJC9LxoTGhB2G+pt2ZT7HMrHFdjqSKOrN/xfpFpqoQEhl
	xlOVBbXTsu4k/rXYY73hUT2kUDmgc8DQNi806SIJzApo3fxPv39yG53R/dMY989mu7gqEq8
	4ClCyrt6Jcx6kg+s32SohUjDMrF6sg/m8BCpIKnNbO/a0EMFeHiiupARd4AcckbgwGDl86r
	szUPcMJrauBcx+kpaybzKUcrB6Cyxy/eYQ4+0lrwcB1eMaggbwft+e+B6ddSkpljcSYO/KL
	9qynecwJ6Fa0tUb2XCwJbxq0v7Y3KNqxtvuCx8s6qrzfI8HV/VZojmvSJ/t8n3jzdED5DIt
	7Ol8nDQSYsFaBMV4m6bh8sOmNJojmnxPnmdl75aCkHWPn8oloC3ylDNb6M7muuA8VOLDura
	a2DEL+Lf7dEkV/hSjQny7Z3yCab1+LQ+OXowpR6ZeTD7VVUtFdOEu20Ce80hB4dgX8RwQcj
	b+odPuv6c8pUcIKrDrx0aKqLkOt6k12yfF21eNaJDbIAZzIKbI3yxcLEC9kNxESSPU8t36b
	3IHvLzCXGVVEvZId4ImtLxYTRweeWz6aOEnYfVvEEgZp70pLFJD7hy05zEDhFG3hkgy7khW
	46mSgIlfiqc9H6My0ELD/WOHtYF2n968Pv01Skzphzm2rfqAHoaCrbX60hZWauuxK5AiNoz
	cjCwcr0OMMTNcBligi6aWVddBuHL7149FwsNYcIkpNo0X7gRFhUb5SGHNcUwS+4FyKYCWsi
	Cxv2ASYHc3JOth0AlMRwIsCpQrepI626vvVO1wfbKYWXNBBu4lbcrKeDx0QTFBpyS+JeqzH
	GPmTZbg9n/5ksWrn+M3U1LKmplkFoozM2247frgn8Ta1lN2igsxzq+swrOBmYQPmxYP8QyY
	9ME5DSmQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Are you suggesting that a commit from v6.8 reintroduced a regression that
was fixed in v6.6?

If so, we should address this issue in the mainline first before backporting.

As a general rule, we avoid introducing out-of-tree commits to linux-stable
except for reverts.

For this patch, merging it into linux-stable is crucial, as it would prevent
certain configurations like loongson3_defconfig from building the kernel with
clang.

To fix follow error with clang-19:
	clang: error: unknown argument: '-msym32'

Thanks,
--
WangYuli

