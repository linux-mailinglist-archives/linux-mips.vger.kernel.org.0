Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DD2495BF4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jan 2022 09:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349730AbiAUIcg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jan 2022 03:32:36 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6896 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiAUIce (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jan 2022 03:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642753955; x=1674289955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mGsCY6kp93h2hKCHyeJMKzpZRBcoPAiiYRKVIrpmDQE=;
  b=Wad3xA+KXnLEwz0Bdwb9mO6SBLBzyK+vNEyS5RCzNZC1MQhgRbwp0iRL
   kT168qn0MICBHURtB5JYyOXC7GCR4BsrymIkbGPIxC4TwRykfZo4/lY+P
   SPoW55iKvIFzi5I4tPDQngPYY1ehoW4dSScEFDzwEn0EInH+bKfS1HrnV
   Kg3aaWZGpgyB9hW8kTNGAouoRAhK+zYfcLonCFxlTen5g5DYpm+pBcjYG
   8Z+/a05v9l6Dfist+DjCQJG3zZ1Y/CYEFsM8xqcU8We9e84cuEuJ7GYzh
   nq2KKEGEUNLCkABNp2uuzNzcSSymJgR32RTLEezbWdSaxdjIV+DvcAA1E
   w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="192036644"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 16:32:33 +0800
IronPort-SDR: PvYNE8e6pP4G7n1JKhyj/t5XbQvzHYwsBmj6q6nnzy3+pADDQHydNmLizfY5IqCtAywI1RJtcS
 cjeO/JV76e7uA3zeCtCZNmMbuDSkP92eyNl+g7Iov8yzqk6Gh+BlpF4oJG7FpTB7pzeyxXobZN
 UPpUg49ryW98zSWehSC3HSnOjsTvhOPm4GZuqFIIQbPw9pxeeSQWXZMvQTKWdoXBVeJAc8Pc4H
 3KRw5irA+MW9iDiaD2rpSuqVWKM40gUQaBAa3m7HYtd2O5WJdxG5uT66NWXb4cvoSpZYjBd8GL
 0lM9iDwl24ywCR6gnsAVAgOf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:04:44 -0800
IronPort-SDR: iRZ0eM6c4vcFs+YWhPTFnEi+Sby+rppmhH05QfRrKoUc6khIEYk13ZG5kBoQtjFmqObgPiAFEP
 iUSkjQWqFr88iDyinpdyoQgUMPOlvHCj5sDzmMR6ybM321r6HiK4RjzaMB2QeLcj6gDn3mj79w
 iM92ZIsMjgypErrqpaMJT3+SWUKsljsGcxGT/OKsRSt6pYPCVWbffI0DDRENxp/IeLGCe1oJrj
 RLDf7YMQJIAJqGGArey8fj6t9HaJw5llCpKuUOMIP92iXSSoeVqZXjtIdpqYjUlV6NvlQuOxsT
 SGc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:32:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgCL85wh9z1SVnx
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 00:32:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :x-mailer:message-id:date:subject:to:from; s=dkim; t=1642753952;
         x=1645345953; bh=mGsCY6kp93h2hKCHyeJMKzpZRBcoPAiiYRKVIrpmDQE=; b=
        IrvzRAO6C5RcmmqvZEHkeGaAgK7xw9r7Jih9Tgjv2Ine0SRuEVSELaU1AsvmjeNx
        ODec1isqFAHVg6FxsPBi5DOy0Df39ZQdsWih/rmItAM0pUYh5w1WmTXZJgKuKLNw
        NAE8qpuU2hLGhN1u0nlXVM3UnwQoX+lUYJsSZT85cftNXKX6fCE7x/yPXlzZZmGu
        tFMv4EZ8rN9xH4dNMM++wEAaZf2qgPO/MxWzY6zHDVYXBgZ1cyREX0wmpQwJrida
        yX4KPd4Gh/udPLrO8QvLiSP9zpHIzi6X5lNCdWlaooXr1yNGbeCupzQJPktt9jVB
        rHXZP/EAXRDauLZPeF6NFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id gEzafFW68_61 for <linux-mips@vger.kernel.org>;
        Fri, 21 Jan 2022 00:32:32 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgCL74hsjz1RvlN;
        Fri, 21 Jan 2022 00:32:31 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Cc:     Hannes Reinecke <hare@suse.de>, linux-mips@vger.kernel.org
Subject: [PATCH] ata: pata_octeon_cf: fix call to trace_ata_bmdma_stop()
Date:   Fri, 21 Jan 2022 17:32:28 +0900
Message-Id: <20220121083228.969805-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The first argument of trace_ata_bmdma_stop() must be a pointer to a
struct ata_port, not to a struct ata_queued_cmd.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Fixes: d3e140f2b008 ("ata: pata_octeon_cf: Drop pointless VPRINTK() calls=
 and convert the remaining one")
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/pata_octeon_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index 0912846bc1b0..05c2ab375756 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -595,7 +595,7 @@ static unsigned int octeon_cf_dma_finished(struct ata=
_port *ap,
 	union cvmx_mio_boot_dma_intx dma_int;
 	u8 status;
=20
-	trace_ata_bmdma_stop(qc, &qc->tf, qc->tag);
+	trace_ata_bmdma_stop(ap, &qc->tf, qc->tag);
=20
 	if (ap->hsm_task_state !=3D HSM_ST_LAST)
 		return 0;
--=20
2.31.1

