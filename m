Return-Path: <linux-mips+bounces-11930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CBC22191
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 898FA1A22452
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 19:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01A433343C;
	Thu, 30 Oct 2025 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="H53jiJ9v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA0332ECC;
	Thu, 30 Oct 2025 19:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761854256; cv=none; b=pzqTmCuBzPu3zK3zrpK4svfbGhd9G7q1LTtkXrc2QNKo4D6wi10KQiyMULSy5B9nc55HxTp3uJ3qSuhzapS7Luiie9LxK9CCaoRBgd3yyM53Rx/fNnpv0vYwQIDo4Nh/UdJby9ASxCkYg+JIId9uQuYz5r/Dp2AptNAskUlKfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761854256; c=relaxed/simple;
	bh=7o3eMG/tPNJGFFG92GloVzfDNlzxSqlGIvUiFF1eLqs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Ua1awAFTZDpaEeMGjAtK4EUw/wJ9RympJ8znmEz+oIK/EoyulQcp6XHrC9y2TaTsCpV990P8DPETrpIxhHlTLo5zg5ZvWM/crhC1KOIBPxZLSAmCIuJElhPgyLsOwYqRr1rEWuEV6sNF+OpScYRc9XG1JjalFM+hnbZJudGKQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=H53jiJ9v; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761854252; x=1762459052; i=markus.elfring@web.de;
	bh=AD7M4UjLJ4HveL7L1KpshIYpSkrvNHljXd/PxMpIrlo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H53jiJ9vkjLKjEDfNmxnLOrJQFfiIGUFvHWEn1q1vd6QLxtx0RgrMmtuZbrvatTz
	 yrMO1a1oOtDnms2q5eLMfrKJ5Yhh8VLsQXYUuEnD8+cIO7dz3Gah2+4QL9n2aKKR+
	 w+tHtxlc7Ed/ADFkR9KLeYPvKPClcEUCNRfQjf6Eb+7rEQYBk+tG03MrFs2uGocRK
	 8IeqzucJvPXvwffc/60BmE7d972KKsV6ewh5AxZZIX3MkxsIXiSgOqcw0RNqsrEeb
	 ccv03dcw90U/qwlNTfLZhmtqmLjJbxGXKqUaJ1h6uLzj2U0UNrVyNc6s5WDLPAET4
	 stcHKXP5+Y/uIXAm6g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoNV4-1w350N2bPc-00gwlr; Thu, 30
 Oct 2025 20:57:31 +0100
Message-ID: <037fcb01-b723-42f3-b3e8-9a351e1caa47@web.de>
Date: Thu, 30 Oct 2025 20:57:29 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jinyang He <hejinyang@loongson.cn>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
 Youling Tang <tangyouling@loongson.cn>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, Miaoqian Lin <linmq006@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] MIPS: Loongson64: Use pointer from memcpy() call for
 assignment in loongson_kexec_prepare()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HDnuX2BAkjNSu+EOHCnW/ReiiUh/l6xQmMyYJAcMBeITbqWYpFe
 TNIFWMaKMhPUwcGgtLVu51LkiYsABFTlCOYWPOStkxmkg+CH6YHI9iu+XVQ+xhNkK1nPVlN
 DsFk8ocufFS4HQNiwYgbqkM75uVsla0sRnCKTsFEptWHi7CquXSZ1k6s4htOlEI1LdzU2Kg
 /9uCZRUKTmsBUjPPj5MSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aU1zPsGhGls=;7VV34wt/FdK+TctiU2h0ngBsbeM
 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
 sKlKlkVsN3a15kP1nmyBAJsWPI=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 30 Oct 2025 20:48:11 +0100

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/loongson64/reset.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 3e20ade0503a..ce412f5616b7 100644
=2D-- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -76,8 +76,9 @@ static int loongson_kexec_prepare(struct kimage *image)
 			 * of parameters (as bootloader does).
 			 */
 			int offt;
-			str =3D (char *)argv + KEXEC_ARGV_SIZE/2;
-			memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
+
+			str =3D memcpy((char *)argv + KEXEC_ARGV_SIZE / 2, image->segment[i].b=
uf,
+				     KEXEC_ARGV_SIZE / 2);
 			ptr =3D strchr(str, ' ');
=20
 			while (ptr && (argc < MAX_ARGS)) {
=2D-=20
2.51.1


