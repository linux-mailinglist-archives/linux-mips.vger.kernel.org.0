Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6804B18F887
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 16:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCWPZ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Mar 2020 11:25:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:58633 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727388AbgCWPZ4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Mar 2020 11:25:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jGOxd-0007im-00; Mon, 23 Mar 2020 16:25:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 08279C0955; Mon, 23 Mar 2020 15:46:41 +0100 (CET)
Date:   Mon, 23 Mar 2020 15:46:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>
Subject: Re: [PATCH v7 0/3] MIPS: Fixes and improvements for CI20 board
 (JZ4780)
Message-ID: <20200323144640.GA10431@alpha.franken.de>
References: <cover.1583528793.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1583528793.git.hns@goldelico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 06, 2020 at 10:06:30PM +0100, H. Nikolaus Schaller wrote:
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> 
> 
> Alex Smith (1):
>   MIPS: DTS: CI20: add DT node for IR sensor
> 
> H. Nikolaus Schaller (2):
>   MIPS: DTS: CI20: multiple DTS improvements
>   MIPS: CI20: defconfig: multiple improvements
> 
>  arch/mips/boot/dts/ingenic/ci20.dts | 19 +++++++++++++++++++
>  arch/mips/configs/ci20_defconfig    | 21 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
