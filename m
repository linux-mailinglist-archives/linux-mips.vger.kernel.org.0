Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE6C153AD2
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 23:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgBEWSZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 17:18:25 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44372 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgBEWSY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 17:18:24 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id D532529A90;
        Wed,  5 Feb 2020 17:18:22 -0500 (EST)
Date:   Thu, 6 Feb 2020 09:18:21 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
In-Reply-To: <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
Message-ID: <alpine.LNX.2.22.394.2002060918030.8@nippy.intranet>
References: <cover.1580610812.git.fthain@telegraphics.com.au> <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au> <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
 <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-850924153-1580941101=:8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-850924153-1580941101=:8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 5 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:

> Note, you need to rebase your series due to:
>=20
>   commit 8a48ac339398f21282985bff16552447d41dcfb2
>   Author: Jani Nikula <jani.nikula@intel.com>
>   Date:   Tue Dec 3 18:38:50 2019 +0200
>=20
>       video: constify fb ops across all drivers
>=20

OK.

Thanks for your review.
---1463811774-850924153-1580941101=:8--
