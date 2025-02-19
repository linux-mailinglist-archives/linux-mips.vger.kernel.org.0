Return-Path: <linux-mips+bounces-7860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93FA3C1B4
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 15:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787511887176
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 14:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B268D1F5853;
	Wed, 19 Feb 2025 14:06:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDC1F5838;
	Wed, 19 Feb 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974009; cv=none; b=G4Qxce8kzq9TmO7VM2/KIKizMNQmqe5dZ2ImH5cgiTR296cXk5yPn5xt1IH54Yglf/bTivGcWI5mn6R6UIxyqSovfD4tftrNqQLGtmsWW2V53lHwiygv/tKhL2G3awjJ7ptq+KgyVi2Wds6Rf/OidfwIXuHA0P9oIDz6+sDGpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974009; c=relaxed/simple;
	bh=CIMKBpM/otj/+4OgQScDBpEp7jJhRHbiXbYzvPVbUbQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=lCTlHMszaCrBJfrhY2tsC6StMKGvI74T99DMc5pncm2NFm7hNkpk9qREiRKrf/qnrmUvXcBeN3LPKw4VHXYyRr4dlJBv7+RjOeEMoYbR1MT4IOGn+gDVBJ4jQNP7jiKga00XOL2++Y1FgQu2PrdtxTbblUqRXMXxwGfYkILwe3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD261343050;
	Wed, 19 Feb 2025 14:06:42 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com
Cc: arnd@arndb.de,chris@zankel.net,dinguyen@kernel.org,glaubitz@physik.fu-berlin.de,ink@unseen.parts,jcmvbkbc@gmail.com,kees@kernel.org,linux-alpha@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-csky@vger.kernel.org,linux-hexagon@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,linux-mips@vger.kernel.org,linux-openrisc@vger.kernel.org,linux-parisc@vger.kernel.org,linux-riscv@lists.infradead.org,linux-s390@vger.kernel.org,linux-sh@vger.kernel.org,linux-snps-arc@lists.infradead.org,linux-um@lists.infradead.org,linuxppc-dev@lists.ozlabs.org,loongarch@lists.linux.dev,mattst88@gmail.com,monstr@monstr.eu,richard.henderson@linaro.org,sparclinux@vger.kernel.org,x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250218175735.19882-2-linmag7@gmail.com>
Organization: Gentoo
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Wed, 19 Feb 2025 14:06:40 +0000
Message-ID: <87cyfejafj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lovely cleanup and a great suggestion from Al.

Reviewed-by: Sam James <sam@gentoo.org>

I'd suggest adding a:
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

thanks,
sam

