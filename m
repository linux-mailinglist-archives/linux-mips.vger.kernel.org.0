Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4043046AE
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 19:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389511AbhAZRVl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 12:21:41 -0500
Received: from mout.gmx.net ([212.227.17.22]:48357 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729435AbhAZIA1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 03:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611647932;
        bh=fiH1eSkKMjtnVFMM7I/tY1R5tAWdJnbYjeo7a+GtOpA=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=C+MGNXRZlkHBSWh7swXgnyNBtpjJ0R1qa/3leia3i+rvHpRPixfveDYzF7GF0FNAR
         DqnJcNCCZaC88OkCuZBHIiOuLArjs+f9mDs5druTjbCC0+0mdRzT+/nEslOMq32LY0
         5ssS50a6MkZYK7zhHNu0cf8j8Y/2Y159jv+omJPk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.167.181]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MJVDM-1lJdCu0Xyy-00JqKg; Tue, 26
 Jan 2021 08:58:52 +0100
Date:   Tue, 26 Jan 2021 10:00:30 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org, cand@gmx.com
Subject: Re: [PATCH 0/9] n64: small cleanups
Message-Id: <20210126100030.374cd4adbd3b9db72ecaa757@gmx.com>
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:6gViuzsL8awiGdS272Fx+Wl3fWGihJoPZmfIRqRFfycT1qeDJBz
 yTj2rMZRUZ/Va7e7fPdGRkNxD1CF9+65cgZU89FjsFhtcXICCN7lAlt9dCzNh348LnLaSlz
 IvO7pkrF4QnoAlc7p7BBvlBSD/0z1L2vouRnLZSHD1pT41D4QbV4bEL/NfR3sgy3v30ebI5
 jQKamQbenBFyqm/oT5wIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJ0/PAv0qPg=:25b98VcygCgts5LzlK9xUt
 BEgM0gM0XO1MZRl+fBryVvhjuGxFX64Bceqe4cy8vVhlTitQMEdGqcSh/8o4Hx1evJNB3ZIYw
 Qbp+mp51rIYBbEgsXcJU2PTuwHDrWzEB3viuh487S0KuQ2QBy/71E58XUut/mgpgymSTWCqpw
 iIP1bGwCiBPfsQ3LX08orVkaxVS3+Hr258jzSSwbsP/HNytiJMqz+JETRRh/gXWZ3XPAGFuSj
 ZbZwRpKMUFFq/rEfiOYW/Qt/U1lPK2TMk0+X9zXtuWxtWT6TUR47HbCsqN++b4HXIf/IhRtye
 Kns0v17ey6MnhnC3MwIwLpFSpFfK/g/UVWpazFzPvHHVjzRI3vGXqLVml9UosIrOsyuuDvPsa
 1ED0TU6ImZ0vo9pDoX3gR+Oy4SH+ijATPsjekQVxhixBDxJQuJlY5FwuQjUm4OcU43ZWyeKwV
 DUmkd8A8plGC21fV3VSPn7+KAHE2IATMRfpLG7rFSrvIOj414LH7Wg5SdGK587mtpp0GVlwna
 Hl3qtLeojPW0zVB5wUDGyyegvs64C5yODDBBrG8QlZoNGry3mT2vkSupMEuWnP1nFc4E9zXJX
 SU32Lxo7H5P+Z5rcMNq1Hcvaovo5/Ip+7UeHhoGOao15DM4uI+3cetWvfm/bd3bl03wv1nnro
 zoRWxG55/pUZCwuE5mz4NPunSzT/qMUcuLkaR+Vk5iLoX3gbRsAJMONkoEvvWC384yojHwQSh
 wevEvInN3Tr3fCYke34z88Zg2MV+2hpDf0jhCHWVfke5gtvUgQFYVx238M7Fy2RX3JLXWn3GE
 cSlg4yWaT6Kli020mtZr7IOL9pjX3rmJm7p+T2qf4oLShp+b1gLoQYEWt3Aeyw9kXFgOoi/Vv
 hg1adAQPoFCx8SzF6U0w==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 Jan 2021 15:32:34 -0800
Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com> wrote:

> I've got the reviewed-by tag from the driver owner offline which
> is added to the series.

I confirm this, he sent it privately first. I approve the series.

- Lauri
