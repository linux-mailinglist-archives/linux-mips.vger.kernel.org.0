Return-Path: <linux-mips+bounces-6178-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5B9A55DE
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2024 20:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0E51F2223C
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2024 18:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00241946B8;
	Sun, 20 Oct 2024 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="k+hhx1LD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DD01C36;
	Sun, 20 Oct 2024 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729449195; cv=none; b=TsNSj/uh1zxfzkKKpXCiOlKJ3okyo97iQmZf4wfaDKDgoO77YD1xLJScCEnMkvOPFmRXXGumpPtFxdXmtKH7sMBlgFn+DbOeTTow5ix01hT8U6rf/yJ359ufwfINMarTd3Wb1PzWLTUVQQti29V9UCGre3eA7RtNCoLio9kTKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729449195; c=relaxed/simple;
	bh=7zS9LgCuegtT1r29iepmpaLf+HDM1XfUghk4tDogoMI=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=pXBpt9Z1i8wZYmx+61rYgwxc0rssDPK3fxy4r+DZT+PlybIJ2ZRi8dBlG58ASwARGH//02XDvItm2hal33VSMCXHomzHA0DhwZKs5jGsqtj+lh/NDlMFQ3eUexcbv9XBSFPAXjP2iGCd43YbvGOYn4523N5MG3d2beHqUfvdjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=k+hhx1LD; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729449167;
	bh=7zS9LgCuegtT1r29iepmpaLf+HDM1XfUghk4tDogoMI=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=k+hhx1LDyM+PVmJVBjK1Zk5oj6XRMjjPjzD2H8Ioqv2IaaXZ8GXwM7akk4ScZD9G/
	 gm5/1b1mGDDC2/Kz4BhzTp2VEczh0l0jLRVfrR+EsDbsYlhO1nDswiBHvhiXH0Ufs2
	 dRRJSiLCqbZiIP11jhOokyW7Fn1pdxNYOsQzpNl8=
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqT6iyfUez+DXx4B7ybItHVbSxkDlA8/kMI=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: TH+dqHvnpIcA+xjSIp4Cm5wWhWI7qq5iIX//KGIeFeE=
X-QQ-STYLE: 
X-QQ-mid: t5gz7a-2t1729449164t1912447
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?RXJpYyBCaWdnZXJz?=" <ebiggers@kernel.org>, "=?utf-8?B?bGludXgtY3J5cHRv?=" <linux-crypto@vger.kernel.org>
Cc: "=?utf-8?B?bGludXgtbWlwcw==?=" <linux-mips@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?546L5pix5Yqb?=" <wangyuli@uniontech.com>
Subject: Re:[PATCH] crypto: mips/crc32 - fix the CRC32C implementation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 21 Oct 2024 02:32:44 +0800
X-Priority: 3
Message-ID: <tencent_30B18398340F6B010D39ADC4@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20241020180258.8060-1-ebiggers@kernel.org>
In-Reply-To: <20241020180258.8060-1-ebiggers@kernel.org>
X-QQ-ReplyHash: 3397747520
X-BIZMAIL-ID: 12910453508724484820
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 21 Oct 2024 02:32:45 +0800 (CST)
Feedback-ID: t:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MjlOSqg8Riw0QstQ4fiQeYNFF4r/HJu7gl8cQxRvD0nNC3tm9OFZRlAf
	9alTxDZUuva5xOItqFK0LJ/K0surbr+pDCW1qwkknBbdQHo9AevegkDTsg/BWuRpqX85dHN
	qVXdcmRb1LXX58bc10/ZejmnHMRhPkAXtd1PeXTJI7a3/GYGBhFCjKZ6jIq0x/ILpDfQgFF
	E9haRf/kVkuUWM4jRHdn1KY+W/PStE6Xr2vHRHezKX+VA3gFjPKbZncUPOxvUE4sFc309nW
	hNyp1XjHIrAO4s75A86Rh2z2/5QXVeXr1QH5OrnZWQNhmvwUDx/yxQ5TB+0AlTlu6CcbCU+
	z5lh2GO2lGvl5o3NvoBh7JbQXm5WEclzTM/lSF0AW0+Lp4kHT4WnKxoyCWO1S0cYIRhRvUa
	xZ7ZmmcX3D27AMAqktQhI0Q5VWXmgZVjdl0pXRtaxW8JRVQuyVaAn5KQdHP6SOuQSIQECDm
	TVySfwx4YlAxIH8cYk3NVl5nyo5ITPU+Ud7HXD7RN1iYm1AWvXRMDqLZ8aqabzFahaah/7X
	/lyRdO1BHp7FJGTYX6R2SsXeKNy1CxeV62HplDHBL7Vklylzq4gUkELF8obbf9o9FkXlU7q
	4W7UaHQ/agD46DdtRXDnkvJqefZXZoZdn3e1OFsLeiSBDe31gEtwKUVIxWO0MRFnYkVxHCf
	s4C18bP3u4LvWc27zK++rjN7MqtNqk9pgYHtS4rASwTO2hSgzsDkLFzpPOhFwFgUuE4Cej9
	X0uqC1TrTHA7YRTAX4cIxjacYHTqDRVLLBfcrZTTGO+62zLueoJQfkcGfxKNYql2pCo3n8W
	xrWQxb1aUA8gWa1X1AamwYfsOoZTviHgxwkZbZCJPu736DWvWqXDUHsT6XBuw+13/8LcWwZ
	BXawx0gzzs9e9z2WhxWiioyx2Vrvo5aV8c+dN0eWsmqfUsnGMBj2nm+7jdVkVFn/IlO35Ml
	VPRAr4goyV1AwVywfeyitAPtn
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

VmVyeSBnb29kIGNhdGNoLg0KQWNrZWQtYnk6IFdlbnRhbyBHdWFuIDxndWFud2VudGFvQHVu
aW9udGVjaC5jb20+


