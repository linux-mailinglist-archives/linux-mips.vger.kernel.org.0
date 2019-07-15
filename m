Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5864768898
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbfGOMK0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:10:26 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25583 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMK0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:10:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192614; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=VTd8k7nFPttTFmS5OaJfCcn0CQH8Qt0lRcDPPLnCIttJSqppbx888zl+lEIAD7vzfvUOjfmn42tT41VSr1BFtLB1HE0nw9caADl4l2IB3Yx6uz3AFAkVlsefXtGF5nvItiuAoYtqPhlPO1Dqqd0tiolMOJa5nPhV/Wg3g/n1UPk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192614; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=qGStA4+mLcL8rgw/baYTmqesvxMF8XRTVeN9ut3inVc=; 
        b=OmlGzUDKNCPo/TU8vLEQ8TXhb/eVB/DLOzbl+6REb1OiqT+Ec4SbOENKauRPx0Y+Jf66sr2ilCQKvXMQf5NZt0/wCf/wIY7AMHpBWfhKYuECUQivWsexnnB70ba8oovyeE3+F+T8CSW732Bajd6kjCEtga/OLtnvgOg5P6J/Cn4=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=YVdK9DGqSMEMzxBxNUz03pxe4yh4eYSLcsBoaxv4N4g0Amu1pWs9HwS274x6uhYOCUQpJYa/sK+W
    EOBUQ7DQlhg1+YNwb+eCx7guQnp8H7B1iTDeg0zDYOS3t2rZU+9M  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192614;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=156;
        bh=qGStA4+mLcL8rgw/baYTmqesvxMF8XRTVeN9ut3inVc=;
        b=MnS+2ZChKkFen6C/Qpokx5tSOG2QrEXz1qLM7htqJf2E28NOxmWqpTAYLLQqCxgr
        9Dp421DpVq/dkri7JJkjqU0k+hKHdOb5xTA3ZRIrTy1UnZwA3ThWAwS/13vywkfF4da
        8ThwJ06OK3hnt3GdUja+qHtEqQ4fbHYv9buujSb4=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192612626212.40196793958535; Mon, 15 Jul 2019 05:10:12 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: Add Ingenic JZ4760 and X1000 and X1500 irqchip support v3.
Date:   Mon, 15 Jul 2019 20:09:47 +0800
Message-Id: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2: Replace "__fls(pending)" with "bit" in function "generic_handle_irq".
v2->v3: Add support for probing irq-ingenic driver on JZ4760 and X1500 Soc.


