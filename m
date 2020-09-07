Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A973B25FA95
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 14:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgIGMkM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 08:40:12 -0400
Received: from crapouillou.net ([89.234.176.41]:59968 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728824AbgIGMkF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Sep 2020 08:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599482367; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mqFsUUpJ6xlq7t1yE+02lOM3Yofrs6S3nfI5RCvssQY=;
        b=uQJ9Az2slZ5hoCCqggRd0wRymIGGUuNFXhc530upwmyPTXCblo26JMh8rS/jwPvjSPHNMV
        8AhvIdD+ohmQGGIEduPoXi68hwUPCaronxBR0l+XYK5vEmKAfTBW6R7K3huHz7xPBGe1hv
        OmEGCtAq7Nk+l/lDqbLi8zZXIE+XD+s=
Date:   Mon, 07 Sep 2020 14:39:16 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 08/15] MIPS: generic: Support booting with built-in or
 appended DTB
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <GHGAGQ.AWUXFCW2HAH71@crapouillou.net>
In-Reply-To: <0e65a59d-74ad-f521-5728-62a4ae58b7fe@gmail.com>
References: <20200906192935.107086-1-paul@crapouillou.net>
        <20200906192935.107086-9-paul@crapouillou.net>
        <0e65a59d-74ad-f521-5728-62a4ae58b7fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le lun. 7 sept. 2020 =E0 10:54, Sergei Shtylyov=20
<sergei.shtylyov@gmail.com> a =E9crit :
> On 06.09.2020 22:29, Paul Cercueil wrote:
>=20
>> The plat_get_fdt() checked that the kernel was booted using UHI=20
>> before
>> reading the 'fw_passed_dtb' variable. However, this variable is also=20
>> set
>> when the kernel has been appended, or when it has been built into the
>=20
>    You haven't fixed s/kernel/DT/ here... :-/

Dammit. Sorry about that.

-Paul

>=20
>> kernel.
>>=20
>> Support these usecases by removing the UHI check.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> [...]
>=20
> MBR, Sergei


