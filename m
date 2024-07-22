Return-Path: <linux-mips+bounces-4421-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51D93904A
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 16:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1A8A1F21EDF
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BED16D4FB;
	Mon, 22 Jul 2024 14:05:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122AB8F5E;
	Mon, 22 Jul 2024 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657123; cv=none; b=oLH6IcEVQNQvEcOyxVfY88ltfdFnAWThfEkvZKxWX5P21Kc8tLUScs7UI+9QQf3VPP+7IKCvOx9//KctRQ7mKykQFJHcvrUk+gULPnnmcArgMxYo/vgZkh7UZzOfej7fZMw0AV1Z2XI5bHA9Qq64TBVktraZtRoPP74yln8hAik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657123; c=relaxed/simple;
	bh=PNiMLggC12F9PS2N2fc8x2/l4DaQ93BCfhgTNm84lys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trpvMI9baHbF62jrAsOXLuoeE/8Pe341oXHZDuTUkJI1iHbBNzJD4yF6qP8pyssW5v5Qbdum2YcMy1eDtAxRQMjs4yTgx1iBAMXB04Ef5F+AZTsjLlzs5/gWIg//TOy0SAedJX0/qd87pNY3ZlZDCgVEEpj7joFax8jCFxKdX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 3143D3000A0C0;
	Mon, 22 Jul 2024 16:05:12 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1B76C27609A; Mon, 22 Jul 2024 16:05:12 +0200 (CEST)
Date: Mon, 22 Jul 2024 16:05:12 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ralf Baechle <ralf@linux-mips.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>,
	linux-crypto@vger.kernel.org
Subject: Mips handling of signed integer overflows
Message-ID: <Zp5nGEBD41jBnw6B@wunner.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear Mips maintainers,

back in 2006, commit 36ccf1c0e391 ("[MIPS] Make integer overflow
exceptions in kernel mode fatal.") forced the kernel to panic on
integer overflows.

But three years later in 2009, commit 68df3755e383 ("Add '-fwrapv'
to gcc CFLAGS") ensured that integer overflows are not undefined
behavior and instead force wraparound.

I assume this means that the compiler uses non-trapping instructions
for addition/subtraction on Mips.  Consequently, calling die_if_kernel()
from do_ov() in arch/mips/kernel/traps.c should no longer be necessary
as it can never happen.

Can you confirm or deny this?

I came across this because ecdsa_get_signature_rs() in crypto/ecdsa.c
performs a subtraction which may lead to a signed integer overflow:

https://lore.kernel.org/all/Zp5b7ZQaXfGbkCVC@wunner.de/

If gcc ignores -fno-strict-overflow on Mips and raises an exception,
the kernel would panic in ecdsa_get_signature_rs() for a sufficiently
large ASN.1-encoded integer.

Thanks,

Lukas

