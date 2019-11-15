Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2598FE545
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 19:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKOSt0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 13:49:26 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:44502 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfKOSt0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 13:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1573843763; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ohpqI6lfvtgqD34/fZTEVxf+jaaLC5ExOj2b8LNFDo=;
        b=IenxWQvCKKOPOyhjCm3TXbld5ozx4Omq8jCVxJovxViKYJPGmOQvJGYZrj8IJuQ55BhDo6
        fChEloDq2uHF/8apUjenSnRFgHvCpDCNMN+jWyCVX50zYZb2891PPIXbIUGQirnDY20L+U
        ZKC9izE8iObLqIX0e3pNwrop7tOGYNE=
Date:   Fri, 15 Nov 2019 19:49:16 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPS: Ingenic: Disable abandoned HPTLB function.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, tglx@linutronix.de,
        jiaxun.yang@flygoat.com
Message-Id: <1573843756.3.1@crapouillou.net>
In-Reply-To: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

For the series:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

Le jeu., oct. 24, 2019 at 17:28, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> 1.rename JZRISC to XBurst.
> 2.disable abandoned HPTLB function.
>=20
>=20

=

