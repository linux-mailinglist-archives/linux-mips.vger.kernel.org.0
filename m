Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5F3A3666
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 23:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhFJVrc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 17:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27336 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231301AbhFJVrY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623361527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ViPuuVG2OqeHFqV52axiUAscOGrI/FqROmXXJfWF5s0=;
        b=Ms6VcICckgBVstQgLJQ50t3iQMM7CeIKQzJbNDf4FFszqZZdc2tN55k1/mZYTXwD3kNrOQ
        SptiVwPYG8SQckhO9GUI/iBTxkRriDT/mB2jK8LrIVuQWEVtzcpC6hDMh5gzK/C4h/AoyU
        /ylelQRV3+xM7CaflQXhTHDYEUuIAsk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-coTeiWnmOxOw4A5aQ4eGYQ-1; Thu, 10 Jun 2021 17:45:26 -0400
X-MC-Unique: coTeiWnmOxOw4A5aQ4eGYQ-1
Received: by mail-oi1-f199.google.com with SMTP id r5-20020a5448850000b02901f4271c7d03so1896724oic.4
        for <linux-mips@vger.kernel.org>; Thu, 10 Jun 2021 14:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViPuuVG2OqeHFqV52axiUAscOGrI/FqROmXXJfWF5s0=;
        b=Pra+iZRONSLyY6+BJ3YXMjYBYpc94IpPS35ecRJKMSWfFMYYLABnSmaI48VRcxAQUm
         nJi6DxtbWNbQ5jg7uhgDgmpoDvQR1hv+UVhM8HAkNlWi7W8qCXCTZCynYwo63SUaQ8ye
         oM8VqpVuClRVtBW9G11BPWvg4djIKUVQHZw8qMC/7baucYnn8b7dZ5WFPhtkorRG6bOL
         pVWf+DRkiB8IhYMz5I15qu3eo6btJOYBD8PXv8++9IjeDMYvmZcmGsSvKU5d/0iq5VBn
         iCqP0TglJCim8LV+sQ3b3RJJJoyKLvq+fClkMumOYo2TnDtO7jlXI0DKuafz4LUV4gxy
         rC4A==
X-Gm-Message-State: AOAM531rCPF2vuSRSQsAPRh8/iNtcOrJqwpt+9fOq3dXsYlxewpQyDsq
        6iTy7y5JLeswio8FZ4qkawReniPek3gdtzPgwmjM0QYWwz7SIeQD8ODCvdVGNY6sxLI9tR6kt0F
        vEWFBpJy1uVync9Pk36ypQQ==
X-Received: by 2002:a4a:1145:: with SMTP id 66mr522733ooc.14.1623361524882;
        Thu, 10 Jun 2021 14:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMoOE2fXWndbKi6EkTffFwfztc6UDDB9ZibLraP0UKVrXK7cwIRfO3Zax6Rh3Y2+SPIntMDQ==
X-Received: by 2002:a4a:1145:: with SMTP id 66mr522721ooc.14.1623361524719;
        Thu, 10 Jun 2021 14:45:24 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:45:24 -0700 (PDT)
From:   trix@redhat.com
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
        lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, nbd@nbd.name,
        lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
        kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
        matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, jbhayana@google.com, sean.wang@mediatek.com,
        shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
        shorne@gmail.com, gsomlo@gmail.com,
        pczarnecki@internships.antmicro.com, mholenko@antmicro.com,
        davidgow@google.com
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 1/7] checkpatch: check Makefiles and Kconfigs for SPDX tag
Date:   Thu, 10 Jun 2021 14:44:32 -0700
Message-Id: <20210610214438.3161140-3-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Both Makefiles and Kconfigs should carry an SPDX tag.
Something like
 # SPDX-License-Identifier: GPL-2.0-only

Add a matcher to existing check

Signed-off-by: Tom Rix <trix@redhat.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index dad87c3686326..7fca3a7c38791 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3572,7 +3572,7 @@ sub process {
 					$comment = '/*';
 				} elsif ($realfile =~ /\.(c|dts|dtsi)$/) {
 					$comment = '//';
-				} elsif (($checklicenseline == 2) || $realfile =~ /\.(sh|pl|py|awk|tc|yaml)$/) {
+				} elsif (($checklicenseline == 2) || $realfile =~ /\.(sh|pl|py|awk|tc|yaml)$|Kconfig|Makefile/) {
 					$comment = '#';
 				} elsif ($realfile =~ /\.rst$/) {
 					$comment = '..';
-- 
2.26.3

