Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A82C2FD3D8
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 16:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732950AbhATPUk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 10:20:40 -0500
Received: from mout.gmx.net ([212.227.15.15]:36969 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390740AbhATPUU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 10:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611155909;
        bh=9OpbCZvg4ndFuR7TpzmcMUJ9w1TSuGQ6vNmI7zmVPvs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=H6V6T8YWoPdnYvG67o5Rbmk/6cztfTAUcrgqcKohqIxtVHCQhyYOUAmR+CtceC+Lv
         hzi0bVUB9GqzzDVmtbnNFv8iW7Xjp1RlkRGlSjO70uGL1PoTd+FhzEluxZ3WYiXaTj
         S9sgmikx8Pn2i3fWClZcHZ85xp4+NTKzOxD5IN/E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mjj8D-1lj1zz2uFv-00lGYk; Wed, 20
 Jan 2021 16:18:28 +0100
Date:   Wed, 20 Jan 2021 17:20:09 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 3/3 v7] block: Add n64 cart driver
Message-Id: <20210120172009.f805cfbcf526100fa59b5130@gmx.com>
In-Reply-To: <20210120144405.GA3763056@infradead.org>
References: <20210115133559.84b2997dc326c277c4d91503@gmx.com>
        <20210120144405.GA3763056@infradead.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:MSgrzhjXtSQPzh+9sCywa/au0AAKyYmk0ltgO/fmB2EEd1EfPXJ
 zWwXb+64hluAt6OO0ft/EFRoHsTRkjwBDP8o2Ec8iIabYfytcu8l63/yM5r1hdHEV0lvDXi
 rmZ+YtAJlox9wwPkBV1i/OFzVSPVlKzobBN9WxKVKvq6f5GMV3nmTjLEDKVN11WCOfpW+/Z
 2JruxqDJLiFuio7BQ3Ggw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y7sIx65dkUM=:LFxfBUw064rKFVAIszxojT
 MDUDxYHj33i2WzgVsLzLz0ZLxaEbaiuglN7DrhMV5pzyqlEU2EKFSKmXzHZkFG6nSL3xu2luv
 lojUWRT8HDJv/j31o9fTuu8xL4KMfolRtBvCFHcUM7kXH9TkIQwcYGxKAO+HauLCe6grd2D7P
 nvgPVa2efVTcaNOwbRBeLb8moEtrqCtrADrpENVFMz7MspyRY27472i/e/1ZeY2Fzj/v4ZJ7G
 BEeSgAMkcfvsp9LX8hbVB6ae13POjXLFfeNfuEWvO1gcnJeIWRUgNRuHEJpMo7xWEk7k6w2ri
 vNpMOzKDdG3rQ73dsT2zRuHzwYcTg78mVLXLUNUJXFZCdZ2ymuB5mVEulBIVdNg5lQ0fyn0g6
 rx5zsLraFzeevMDKOhE6e2PAw6Qtv6kuM6j0ktPE+UYLweE39Cb12w4O1/mkRFG1E4o8Usnlw
 aRil3j3Zrfx3MkbwA02QXt6Kw1zZRXwbDy336dq7Qj7o+y8Xh/WhjnseiWuIPbvM9CL7YSWCG
 x8eFRgEx+tvRaA5KpeAxOztIYXwctPSGG8GDIdI4a/MMDOEAf/FMfCv5zuTK7DI1pYhq+tPXo
 F0mMUao1696QCqW1kpqnJVc1AyPfdcvmCMQQzjjQLXuejscpaifva76YUkAN1/KY01FqHsLWP
 gL7iGxESkqMsUM4ago1BT/EQ8hjP5tFHUpJwLY39leLmRgqeCAwMES4CvlIzjx4oQw8MLGX6G
 WGJ6/+eRjotcibfgeByMXJ7Oa+H4bVSE5i+fBkJlrnL960w9cVhKsgnVub+k5eZ7v24a4++7g
 IyltSn5aldFQ50WYbSf9tQvi59GR1o2+keG0u2vciDmM1DA7R9VlBjktXqOu41Uwc12Ur1wYk
 jx3tFQDPQZ1pGlNloN4Q==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 20 Jan 2021 14:44:05 +0000
Christoph Hellwig <hch@infradead.org> wrote:

> Just curious:  wouldn't it make more sense to implement this as a bio
> based driver with a helper thread?  It doesn't look like blk-mq provides
> you a lot of benefits here.  And then we could make the blk-mq code
> optional and you could save a fair amount of a kernel memory on your
> rather constrained device.

I'm not sure I know what that is, or how to do so. This is what the
existing simple drivers were doing, so I copied them.

- Lauri
