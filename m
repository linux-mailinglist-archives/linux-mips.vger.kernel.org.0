Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0559724275C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgHLJVe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 05:21:34 -0400
Received: from crapouillou.net ([89.234.176.41]:37216 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgHLJVd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Aug 2020 05:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597224091; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DU8hiVooevw2svajRRMAqZzXiDDtBuJEq9PAFVAh+/U=;
        b=E4ui8yfUidBOt46tCJhPDUvRQG+qVa6jrj9BROIV00BiEjXqezkJ9UCgRj6Y99t+MVqDvH
        +aqd6OM3sNA/4AlItZgKq0MlE6UYEXdd6IMAyQG0wzFZruGN62v0p5NqG+E/fYohjLjXkL
        uQeBHw517SmDBjPPtc6poEM6+JpABls=
Date:   Wed, 12 Aug 2020 11:21:21 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 07/13] MIPS: generic: Support booting with built-in or
 appended DTB
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <LZ1YEQ.KIROREMKUV102@crapouillou.net>
In-Reply-To: <1380509b-6479-3f1b-9e5b-7eb14f7ab158@gmail.com>
References: <20200812001510.460382-1-paul@crapouillou.net>
        <20200812001510.460382-8-paul@crapouillou.net>
        <1380509b-6479-3f1b-9e5b-7eb14f7ab158@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 12 ao=FBt 2020 =E0 12:15, Sergei Shtylyov=20
<sergei.shtylyov@gmail.com> a =E9crit :
> Hello!
>=20
> On 12.08.2020 3:15, Paul Cercueil wrote:
>=20
>> The plat_get_fdt() checked that the kernel was booted using UHI=20
>> before
>> reading the 'fw_passed_dtb' variable. However, this variable is also=20
>> set
>> when the kernel has been appended, or when it has been built into the
>=20
>    s/kernel/DT/?

Ooops :)

>=20
>> kernel.
>>=20
>> Support these usecases by removing the UHI check.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> [...]
>=20
> MBR, Sergei


