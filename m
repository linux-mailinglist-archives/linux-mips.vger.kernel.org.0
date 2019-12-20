Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135761281AF
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2019 18:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLTRx5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Dec 2019 12:53:57 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:11664 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbfLTRx5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Dec 2019 12:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576864432;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=1s9X+rtXJnxaA4mRnY408QIKXl/OpEB6Wrj3+YsevTY=;
        b=mmDSDsCJeB8ADsanGUHtFo6lnZipZuAkHKaWsM7ejFsWldYLTGaGNe+UbYTe/8anfD
        UM+9h6qTEnl6plNGMnPZpUYFmCZMOVYyMV2c2ED9LDG9vXvgCzXpuUcUTuPC3xnN2vfv
        OfzXWq+df5TW/QeDuLHVziT3cEDDpKXzQeG86jIXubyJGsm0awj5mOr8HchUStsrnzS7
        IHeiBr2+0AbfZ+zhZIxQAuiNTIo0JnGH0KDc2tx0T6Zj6scVTxWRxVCzivxQntFI5Bps
        xyYqoypqwkr3KIiXDtAF285MVUmm+zS7SQHIijgEO2V7nYnU1jm7cJkNnAv0OkahGSNU
        erAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vuwDOpExo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.1 DYNA|AUTH)
        with ESMTPSA id 4012cfvBKHrn99x
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 20 Dec 2019 18:53:49 +0100 (CET)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [BUG] CI20: interrupt-controller@10001000 didn't like hwirq-0x0  to VIRQ8 mapping (rc=-19)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1576862814.3.2@crapouillou.net>
Date:   Fri, 20 Dec 2019 18:53:48 +0100
Cc:     Marc Zyngier <maz@kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D90B0805-EDD2-48A0-8DFC-FD3135B86787@goldelico.com>
References: <8BA39E30-53CB-47DB-8890-465ACB760402@goldelico.com> <1576861276.3.1@crapouillou.net> <4ea8fd0952b940b37a174fded9b5ebda@www.loen.fr> <1576862814.3.2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 20.12.2019 um 18:26 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Marc,
>=20
> I wasn't aware of the bug, that's why there is no tag.
> I can send a V2 with a fix tag (and Cc linux-stable) if Nikolaus =
reports it working.

Yes it works! Messages are gone, CI20 still boots, and cat =
/proc/interrupts shows them counting upwards.

Unfortunately I can't answer to the original [PATCH], but please add my

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

to v2.

>=20
> -Paul
>=20
>=20
> Le ven., d=E9c. 20, 2019 at 17:09, Marc Zyngier <maz@kernel.org> a =
=E9crit :
>> On 2019-12-20 17:01, Paul Cercueil wrote:
>>> Hi Nikolaus,
>>> Try with this: https://lkml.org/lkml/2019/11/22/1831
>>> And don't hesitate to add your Tested-by :)
>> Is that an actual fix? It wasn't tagged as such, which is why
>> I didn't send it right away... It'd  be good to find out.


BR and thanks,
Nikolaus


