Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2DE300ADE
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 19:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbhAVSKd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 13:10:33 -0500
Received: from mout.gmx.net ([212.227.15.18]:51005 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729835AbhAVSBh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 13:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611338380;
        bh=eOzb2l5j6gR1pdEt8BfSIAk4n64hXAXv7UElX++IcJ0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=QlWtizuGqlmlYiksRY1OmtNeTUcVbFGjls8Qx1a9LT+OfftAN10NseANzh0iD2Dja
         D+ErhTHWat/oowO8zHQYF2gneqwChBj2rDd87ORa6zCV1Fp0PwCSyM/d46dx6ZKN7y
         P0eIb9zsYerOvXraRvjJU6YLuxhVvMMF5aqaFwcY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MStCe-1lRsCg2GTu-00UHWx; Fri, 22
 Jan 2021 18:59:40 +0100
Date:   Fri, 22 Jan 2021 20:01:17 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-Id: <20210122200117.b1b1cda46cefc840595d2b09@gmx.com>
In-Reply-To: <20210122171120.GA1728441@dhcp-10-100-145-180.wdc.com>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
        <20210122111727.GA161970@infradead.org>
        <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
        <20210122161804.GA225607@infradead.org>
        <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
        <20210122163913.GA227449@infradead.org>
        <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
        <20210122171120.GA1728441@dhcp-10-100-145-180.wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HS2m/2545Fem4QlMKMmibK/76Ejfz5wTEc0itKNnzxCxKMrRYwt
 gELa5cIIVYBu9zcQKe0TKJ6E2TwCHsWBSuEUoEXXDLMzD9v/du2vfA7Sy/b2IyVcMGnQgZY
 GFOdEyZyTK2y5Ay5Kq5ujqdnxcTMlQf1qKkwn1Y/15o/tPXppuxHHpbdqsYLE/PUpw2puhl
 IqKYuKNSrwkDWQhIP36LQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gkh58M8MlC4=:P6qGpu8xPfDkUoDmFtwShy
 O5hJ2zvjBcAGUO3+yaeWsgqHtr196qGSWQ8rJc/orMBBGog7gTWYWWNsA6iVeStCc1e8AbY3x
 xGgHGbj2i7VRGNhovxOisg4U04zCFepHngrY3ryUPN1/Sj1YyGsc+dawSyM1HZcOHxjeQ47mj
 IUak0AA+1lJZ5hWWB4YmfvPqX1lamTB4PuEAhCWi850UEP3fh9p+zD9zS0oIq0/kw5P5cCP9k
 t08mc2rDwnICwT4Yp+tpS7UrYcTZFNJHz8TypByF/MVbMNJZkYJb3c0iQXn/sWHBOv9gYDzgM
 b9vRoCeJaNZ0xnwi/rl7YZsKN/59yoesql6obMfmSFsUrrbM3orEjaUjntWwewt8ImVy0wOLE
 gEQ4kZef/8rf6oiyCOL/QsaJwbjRYwO5lliX7Q+z9MssGlaA1tM9TP+X33qh/hMnrvB1tlV7n
 wZSe1sRUaRBttvatFvyS/SPFBCCYAaeQqkr+mKChFFW+T+E1iYsdMfBCCIAnrFSC3DPc6Otql
 jbXzoieuBKlr6wPBj0JFiI5d4+FDNeH96rMFwhguT6dYuvb4QoSWuqbgfdBhvTw9Ekr2/SEed
 e8SrhqgsG+AFekrC5rkeZyF0dPHMpy4OoqKXsaw4V0Ms2Xg5LTNM2DhdSQ25dRDg5eaVcmxED
 ODgyBU8egKOT6c8UQl/2RrhzQ+oCOldKiud9ZK9SFekPp5hDmuBuYeMcC5MKWLj32yZjEILQK
 kdRcDIiZGfZL0xFn7taP0RQZNz0V6P+nJeEJ9dILMsM4EazzSWF6YBsVysuGMQ8vADjLK47Jk
 GAu6RlypLj3++40YQmtEivuh4ASREaxZXpu6FS+SRBP/b5mb8HpeKlA2MGk32R6ITpB95EKlP
 wpvcav+jUkhNpMdlR3pQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021 09:11:20 -0800
Keith Busch <kbusch@kernel.org> wrote:
> Each bio_vec segment is physically contiguous.

What's the official way to get that buffer's physical address? I
couldn't find any driver that does DMA to the bio buffer, to use as an
example. Maybe used wrong keywords.

> > I grepped around, but apparently no driver under drivers/block does
> > direct DMA to the bio buffer. They all use their own buffer and memcpy=
,
> > like this patch. ps3vram, ps3disk, amiflop, etc etc.
>
> block/brd.c

That uses memcpy, not DMA? It uses the virtual address. I was hoping
for an example that does direct DMA to the bio_data buffer.

- Lauri
