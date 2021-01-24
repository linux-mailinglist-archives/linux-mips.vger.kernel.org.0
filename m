Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB8B301A5D
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 08:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbhAXHpF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 02:45:05 -0500
Received: from mout.gmx.net ([212.227.15.19]:46765 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbhAXHpC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 02:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611474175;
        bh=AmAdNnEJzKULs53RYDxUUiXy+9NQ7DRvCygB7DPf9iw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Bc9D7Mx40MxEc5ETtPKcwl/VT2Je4d2jCpWj49x26Q3Bw+m/cccm3G4aU4/DAEO9t
         kik/OqkslITIayAUgrdZsQhhb13O5tMnxo6ldVubaGvpUsWX8qjTcyoka6BgaDjY9d
         swOAb5bv6zxiT8bxsCWDiNxWoEGTWS9jGEiPLToQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.167.181]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MTzay-1lUZ4v1Gbq-00R2s9; Sun, 24
 Jan 2021 08:42:55 +0100
Date:   Sun, 24 Jan 2021 09:44:37 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        Takashi Iwai <tiwai@suse.de>, perex@perex.cz
Subject: Re: [PATCH 2/3 v7] sound: Add n64 driver
Message-Id: <20210124094437.529881d014970d7f3909d76f@gmx.com>
In-Reply-To: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
References: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f61DG/HxwsJsH91Eh492Z8e2yLM/JWFbPe0AIGnGQyvkSa5aXlr
 18YicU+DYrCV9aNNF1seweI2mSn26bzWJsYZ8k/W/YWQqN8l5vNG6VFCkkH9nNRDCgPKBau
 eTQBnqLUj/IklRMIrb56ge5o6AzSD1nnNyB4aisIq8K3l+m2YBsqmWp/CVPoeRyBi+F6KgE
 c2u/Jop5jPA23HWLJqxGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qkpbs2eeqEM=:lXTo6qLelu+2zf6KX3ie7Z
 P/oBZ4+5m3322g9QdqfufcYQAmRVThuYHrtY2/zQO9qZEVGV6qd0k4buokPs8vvqB+kQUJNIn
 12y7B7GOQmYOj9Py+nLnRMZcX+MBt+HV3JfsdKYOpeIclJZ0WKa8YwBpxFLBDcDl5JlHaSg3c
 5LvlRQhuYvXbn/DLvNMQ5/sMixS+9aPESqSWqOIOdl+5C8ntKFhok0eS3/u5lGzcAHpO2OeDg
 qcKoZw9ZPaDrxfVB0MnEqDK5riy/TzMeI9qxmAEEAZqMxyKCdoSdYzoR46wqeZ5jsgbBYPyMn
 lTno1hYAKFkVPHuvSgyplTFlkE+RTUFqHNsQegUHCXoO3Qti+Kp8futeHPd2COYDlKwONXDKW
 yOAi8Z/YajpNlC8Ui3PVb39Ty9SjLkcV/5GNiOE1tyb3unjvSaEs/Hq5cRf775asWoXBxEH1e
 Wc4sHJuKsFkp/74iXobdKtFfl8o8DDam4KHELN4MB9JHrIVqR+Ioafuwvap4XZMv/X5a7ogaX
 ZpU+qqVUltcf/ZGouR+90akxUNLgwkfG6ANfQpIq9cY/jRJnbehaPJ4qANvC2b4UDGBSjxc4R
 pJ+9d0/GSBNfQBtzaLYwaAPtoFEiC/qS38gMFemOhjNLFom3JNp06XHnh5gvfOsDQjOX2DEoP
 fboi+8FL9XscuFbtEfNdU/VDyhfqAUeI0icAkacahrjtNaY6VOwATGlGiswgcicrgMs7tGon1
 lAJGsNK+TyEWPLG6O70p16a1r4ufN+ozYMARSKOnvHqtIE3T3gR2yAIhEN6LHEzvRvdJ3SWCF
 RbkgYeNVF6zlHWEyAhY0paVOvUqsNWT/sNgX9XDu4XjSfhQ74yRpF0JSnqslgyzIC8ohaIFJS
 SiyEG2BPFpKr5Q39rJOQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Jan 2021 13:35:00 +0200
Lauri Kasanen <cand@gmx.com> wrote:

> This adds support for the Nintendo 64 console's sound.
>
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>
> v7:
> use devm_*

Hi Thomas,

Since v6 had Takashi's ack, and you asked for the devm change, does
this mean v7 is waiting for your review?

- Lauri
