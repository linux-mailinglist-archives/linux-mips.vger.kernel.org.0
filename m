Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C3D23548B
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 00:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgHAWa3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 18:30:29 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:17057 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgHAWa3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Aug 2020 18:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596321044; x=1627857044;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=L14aWr0zcB4saLYNZ4ZyhS1dUVmXAlE8OaF6Iq0FgdA=;
  b=o5sihKwVGvfsakR5GCJLroC+IhZeIQbZT3hDTV5wLQfJGbCQXIhNqAr3
   6KHRWTDTPB0MvpaHe1v+jUlpnLkDaVrIitc7l70YnUTqshiAOO3saognT
   GOGJojN8qKujs2RIwvwtdVVsA6+MKEL3exvGqeuP82OIMQQ/J2NeQoqH2
   jUs/K/Z5PNRv+ZT+Wt2QJsmKld50wuGf1IBnpegzG54GRBYi98Vg0zJ7n
   R9dibNggf/m5rxUHpOuw8gDIJnQjDqvTzbxfO8Tq5X1K0ospQKcpy+StG
   Znpl3tUfWy2ZkzZxjO3m6xkQkBPDgwfbWR2HiC3bJ7qmh/S4bCVNBToGi
   w==;
IronPort-SDR: s9DMmPyl5q549spB2XgcQDblLGo255R46mWGcJzP2Mer+G1YYgEM7twMEcOgucq+3bsQr8SYny
 Wmc4/dGVay1bhYfU26SGd58p+TVXFhJP66IwRL5DwbF4ZYFP4R9DyX8+hRvDk169EUsjlXDXGh
 SEWfsd+Lkd6exqZSme16CgP9X0Y9RAPvjhjfzQU4+kkMnLhpGL9xtSdCCr2Ej1BOgt/ZGr2SJ5
 kvkQ+sYNewc6SnuPVlUUNM2zd772b6AxF2k41DA14af9L20cn7Tn0kqdSHCksaDND9WgmnaqC7
 bZ0=
X-IronPort-AV: E=Sophos;i="5.75,424,1589212800"; 
   d="scan'208";a="247017592"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2020 06:30:44 +0800
IronPort-SDR: 93fkEqGZxT2xPehFCJsKsJMfblXtymZ21W3tURa5K+mjrPrKuzetIYbuL181BXUpQCsg4Pbx9r
 dYIlgnftCIWN1Bur90on9k+AiThn5aH64=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2020 15:18:32 -0700
IronPort-SDR: DtHLDmnKmhjkVWU6YOYbQYaCkmTi6ZXAsPpW+RRW1gI23437Sz3nkHj+2AgpMGjga3ggzSov1+
 3G96KZX3Uj5w==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2020 15:30:27 -0700
Date:   Sat, 1 Aug 2020 23:30:23 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
In-Reply-To: <20200726155559.4650-1-krzk@kernel.org>
Message-ID: <alpine.LFD.2.21.2008012327070.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200726155559.4650-1-krzk@kernel.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 26 Jul 2020, Krzysztof Kozlowski wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index cba0ed77775b..362863cae239 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8541,11 +8541,6 @@ F:	include/uapi/rdma/
>  F:	samples/bpf/ibumad_kern.c
>  F:	samples/bpf/ibumad_user.c
>  
> -INGENIC JZ4780 DMA Driver
> -M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> -S:	Maintained
> -F:	drivers/dma/dma-jz4780.c
> -

 FYI, the usual approach would be marking the entry "Orphan" rather than 
removing it entirely, so that the mapping remains and makes it easy for 
someone to pick it up.

  Maciej
