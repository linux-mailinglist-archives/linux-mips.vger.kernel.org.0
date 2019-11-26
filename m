Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1A410A47D
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 20:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfKZT16 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 14:27:58 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33672 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfKZT16 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 14:27:58 -0500
Received: by mail-pf1-f193.google.com with SMTP id y206so1041034pfb.0;
        Tue, 26 Nov 2019 11:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=qEPEckI9bajeaFnxQwJ5COLddGB79GLajuNLeTcpeO4=;
        b=e9o4kO+SJfvTUFr7ekaSoJerhlzU7PNt4/lFRiZfiIdliVonO67Y3dNUtIS3TfcNxN
         8j4dtavy5yUdKtC4XE1vOIxTTHBwzBdxqpOAG35hF7MH/dIbSklfk0FQnDLLtJPDxjOU
         5ycGObV6uBycS8arKTj4h5LwB795Ji+4Hn+KMpyp8joVMjZnMucqN5AqttcIlLCPlVEz
         VcxtnlkgV3Y2lwpIH9Eu39lfBAT8nCVMqRTigc4fNlzjAM6fLx8WkKcTvJVDJDEqdZh4
         mQGmtAiKXflkQ0m070BVfDZLs8lGvG089jaIE3SUp95gIg0pnXttU6J00Wzx0zaaVevN
         HGJw==
X-Gm-Message-State: APjAAAUOY+YGwYh5NxKZEfXFk3D/S4nTfhSPBBZLprAkIJFuKWQRvQEe
        /oNIy6OTSm5PuwCbINc0E7c=
X-Google-Smtp-Source: APXvYqxqDmbCpIFCUpG6LlVNNtQ6Kt3fxn2xLMfze5sPVdszzPxmXD5qHSLJ3y8ue74YKaDh8+eeXw==
X-Received: by 2002:a65:64c1:: with SMTP id t1mr62495pgv.263.1574796477359;
        Tue, 26 Nov 2019 11:27:57 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id s15sm3826227pjp.3.2019.11.26.11.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 11:27:56 -0800 (PST)
Message-ID: <5ddd7cbc.1c69fb81.550da.d1b9@mx.google.com>
Date:   Tue, 26 Nov 2019 11:27:55 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: cacheinfo: report shared CPU map
References:  <20191124140731.24430-1-vladimir.kondratiev@intel.com>
In-Reply-To:  <20191124140731.24430-1-vladimir.kondratiev@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Vladimir Kondratiev wrote:
> Report L1 caches as shared per core; L2 - per cluster.
> 
> This fixes "perf" that went crazy if shared_cpu_map attribute not
> reported on sysfs, in form of
> 
> /sys/devices/system/cpu/cpu*/cache/index*/shared_cpu_list
> /sys/devices/system/cpu/cpu*/cache/index*/shared_cpu_map

Applied to mips-fixes.

> commit 3b1313eb32c4
> https://git.kernel.org/mips/c/3b1313eb32c4
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
