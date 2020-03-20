Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE4018DC49
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 01:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCTX7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 19:59:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTX7z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 20 Mar 2020 19:59:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A509F2072D;
        Fri, 20 Mar 2020 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584748794;
        bh=9ypyxU5qWZfYyckFKazKeUGCpDXZ35O6N4eoCQ7bCRQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JquCWGuPGqkjoY1/TnuI+qNaSwzYt/5nG/cGiy+uLnK9A0ilk4P3JMClzQyorD0iy
         aGsK/iUing3IoirY9PB1llxSaKyqJAwjDT+MNWnrw0AZSY2saDkvtBj2UgeXzZoo9J
         bvWGeR44NcY22huO0bXs/Dsv9IdEQxJhck4NuF6k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582100974-129559-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com> <1582100974-129559-4-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH 2/4] clk: Ingenic: Add support for TCU of X1000.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de, maz@kernel.org,
        jason@lakedaemon.net, mturquette@baylibre.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
To:     linux-mips@vger.kernel.org, zhouyanjie@wanyeetech.com
Date:   Fri, 20 Mar 2020 16:59:53 -0700
Message-ID: <158474879381.125146.13343412789779262447@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Zhou Yanjie (2020-02-19 00:29:32)
> X1000 has a different TCU containing OST, since X1000, OST has been
> independent of TCU. This patch is prepare for later OST driver.
>=20

Acked-by: Stephen Boyd <sboyd@kernel.org>
