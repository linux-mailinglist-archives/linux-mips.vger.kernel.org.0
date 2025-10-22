Return-Path: <linux-mips+bounces-11852-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B105BFCBE8
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 17:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 249051A017B4
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 15:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960FD26ED56;
	Wed, 22 Oct 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XpKcD6pK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6E2A1AA
	for <linux-mips@vger.kernel.org>; Wed, 22 Oct 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145303; cv=none; b=ZQGiXxV0BmnlV1yCEcyNu8TIN3JDdNDtyezwAb8lQQ5Ne2QzOdiYpIRWvg6O2/WokJooT+mLFIoBTzwa1dOr6h10mvtX/4elbtNzdXIhJw1gcNRqpg4Tdx2vB40sn7IW/PWOEX61zBYla1WXEK/W34j3c/tWhs+NlAJjUtQlHEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145303; c=relaxed/simple;
	bh=4U2l9/QDYtSgR5GQQjzy69q7eIymNUO3nEzJKzqx30E=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID; b=efLGTmeJQzc82ujGDdvaPRPuLpzzF/ONKyGYszlz/WN0ALUsWucDr8O2AZxuEeudVDlW3bDQT7HVJFz2tjvJH8XIBhTf+WLsjCBQ1fWXky+FaRyG9p0xudsLLGCWJ+8tjIRpyKlnyOnxQkmYk9jbpwJ+MLiY2aG08VYaqf7SdLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XpKcD6pK; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761145294;
	bh=4U2l9/QDYtSgR5GQQjzy69q7eIymNUO3nEzJKzqx30E=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=XpKcD6pK8RjQHP8gGEpgjL53MfaZDGmTtVokuY7fEkLYEx5vNlX/TGlGl0aqqO20y
	 ya74k5oRow5SF/KFHL8mmLYwjJ6bBtOdwx4hsRhiPp3XUfzWrnJ3RTEscBw2Dzpmey
	 +MYhV5ruivKUBeBd6ZXqLvYwbNvUShnd5s5fnG4U=
EX-QQ-RecipientCnt: 1
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqRRDMu1q775QruR7Y790WuywJEQvw7b5Zs=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: lP7sFNFka9S+BzoATbUtXTiJW6QOABuqJRTe/TxWPyA=
X-QQ-STYLE: 
X-QQ-mid: lv3sz3a-6t1761145291t4dc9bf3f
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?bGludXgtbWlwcw==?=" <linux-mips@vger.kernel.org>
Subject: What happened in remove bust_spinlocks(0) in mips history?
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 22 Oct 2025 23:01:30 +0800
X-Priority: 3
Message-ID: <tencent_3A7FDB016518ADEE4DB4FCB1@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 3818876977688553840
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 22 Oct 2025 23:01:32 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: OYpbVsTx4C81CfcJuuvDfy4UflpNSEAs0c46dA0RWS6qOeXYbtqDrHsP
	z2xsdH5l3FHlbrnJMasvcCjMmmgMql8P8B0toq45V3TtqDORuBOBgwnZpHA6vRVsNtiO6qF
	A8MLGrxP3EMZhYih29gKyNVLmIykwmtehr2JPNWEvXBjoMCQOVEzeJ1djb8M1hAgckZ0XjK
	x1yMy/HnCX/aiHEwZ23NnldqjzlgMNZxsPHzPTX4mfiQ8HnPRExbhGMy9E2XAHNBMMdQQwc
	4hH8kt/MCnz3hfcyw0/bMKIjOIP/qmk1ptgg7007DStyUcXDQXZORe5mY8T53xlJdCpPvDT
	jsBSfflA7wvLuPzUwQAMtcE01eR24ZYfhFd6K6v2iSmQ9hgygvpje924/iqO9kqsoHCKB4F
	e7D3bO3l2H3ayphhCDrG9Hl9ESfLzTF6s9Un7OKAhf7RTStonC21DCbL7na1cfuM54LIqgn
	c4yuZEw9lCkhFxs8Nq2gI8xlAPIIHcQ+N+GKxRS/MAGmPLGNbalogSrmjmeT8lUe7FdsuUr
	DcXmmEaNfInZiNLf5YbiTnniTjZ0DV5yXv8g6uQ1GAroHIZ7qUDw8nJOyAMUa6eIZIQRlV/
	Oc2pHe/PReKaim++wDS9UgHUrK5SZemU3d80tmBgKufD0DadeMasaUUuOyEK62D8YmvY4+Z
	OJQr6Ja7XDXvIgNLaY3baMKqM0kiSvgCjCaMsJ7aHa/HYpbdhws6pboA42twV+wlgmVUG+B
	ALCOCfb0r5IFE+HrceMxa5aQ4mwOHCz00whXaFAeGJCi184jqLu8S622K2YSee2TjB+90Kp
	Z9dfY+I+ZrEa4Tq1Boq5CtXR+ZyS1DMvUS+iosLk3NPgrT+ygtSZyrqAbzQyZMAyfp/MkBe
	zBZFGLGq1QBJDAz3s84RprKYJTrlYZhIqIcYYeoj5i6rVqOitDnC0eO5t6ye9AVHNZmkZG9
	JOqip6s2elUUD8uGuIOKSol9jQSaF0+1S+Qba5XNIbpjsUE1MaPR632tJaS1vL3OipvDnMD
	HiqpvcROtyCe3g5u2xN+v7OwF7KOOYUwHHlK8o1ENVHEKXFdRs
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

SGVsbG8sDQoNCkkgZm91bmQgc29tZSBhcmNoIHVzZSBidXN0X3NwaW5sb2NrcygxKSBhbmQg
bm90IHVzZSBidXN0X3NwaW5sb2NrcygwKSwNCm1vcmUgaW50ZXJlc3RpbmcgaXMgbWlwczY0
LCBpbiBoaXN0b3J5LmdpdCBJIGZvdW50IHRoYXQgY29tbWl0DQpmMTllMmQ5ZTllYjQyICgi
W1BBVENIXSBNSVBTIG1lcmdlLCBnZW5lcmljIG1pcHM2NCBiaXRzLiIpDQpkb19wYWdlX2Zh
dWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIHdyaXRlLCB1bnNpZ25l
ZCBsb25nIGFkZHJlc3MpDQogICAgICAgIGJ1c3Rfc3BpbmxvY2tzKDEpOw0KIA0KICAgICAg
ICBwcmludGsoS0VSTl9BTEVSVCAiQ3B1ICVkIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBh
Z2luZyByZXF1ZXN0IGF0ICINCi0gICAgICAgICAgICAgICJhZGRyZXNzICUwOGx4LCBlcGMg
PT0gJTA4eCwgcmEgPT0gJTA4eFxuIiwNCi0gICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3Jf
aWQoKSwgYWRkcmVzcywgKHVuc2lnbmVkIGludCkgcmVncy0+Y3AwX2VwYywNCi0gICAgICAg
ICAgICAgICAodW5zaWduZWQgaW50KSByZWdzLT5yZWdzWzMxXSk7DQotICAgICAgIGRpZSgi
T29wcyIsIHJlZ3MsIHdyaXRlKTsNCi0gICAgICAgZG9fZXhpdChTSUdLSUxMKTsNCi0gICAg
ICAgYnVzdF9zcGlubG9ja3MoMCk7DQorICAgICAgICAgICAgICAiYWRkcmVzcyAlMDE2bHgs
IGVwYyA9PSAlMDE2bHgsIHJhID09ICUwMTZseFxuIiwNCisgICAgICAgICAgICAgIHNtcF9w
cm9jZXNzb3JfaWQoKSwgYWRkcmVzcywgcmVncy0+Y3AwX2VwYywgcmVncy0+cmVnc1szMV0p
Ow0KKyAgICAgICBkaWUoIk9vcHMiLCByZWdzKTsNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGdseC9oaXN0b3J5LmdpdC9jb21taXQvP2lk
PWYxOWUyZDllOWViNDINCg0KV2VudGFvIEd1YW4=


