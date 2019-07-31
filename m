Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BB57B8D9
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2019 06:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfGaEkN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Jul 2019 00:40:13 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25415 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfGaEkN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Jul 2019 00:40:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564547988; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=TFGRHsdhbIX3vNwLki21PRSWOjjE0563G18eS+dohN95X3NigULFAbKF6zSDlXCSc+lKdzfywqAiiWGqC/V8VQRkGJ+cO0mJp+URyvehMq58fRVRzAYohAIyypiijrZvU78DXphEN9fplRpDOPIwWzaww0EQKmOhrKZCwNJc0og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564547988; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=f1AiZiVsptl5ZAaLcYQF8aeALD5VRcNwvYuOQvruVp8=; 
        b=eInIkrvwLHZx150iGYrEeLpUOdCURtpfYxVcZxvudBaXm5FfFNRq9zU6i4MCES3BArVVATwXc2xOGuP+e+vockTQlvWRFNAn8HKNNhH2QMoCwlSeFCILiy59iyvvWYXgxln8bm0gMyduewmCzN8LHvK+4o6S8bOZpQ+DKgR8wQs=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=jv48X+8mFAmD9AXipdIj5F7kU/qIgBxOeOzuyrxcADasZwLcc7zQFAwWIAKVdkN6xi2s6aM+hVQy
    sMynO8aV46DlyyQYemKZRZdnxDvwbIN94D8zuwJHz0dbkq5CnNbq  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564547988;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=72;
        bh=f1AiZiVsptl5ZAaLcYQF8aeALD5VRcNwvYuOQvruVp8=;
        b=MXqEU0HxDszIjIAJ3OriFGAYMIXRZ+Al8baf5nQMgaIF79auq37bul+qSrOYINgh
        GeRIxc3BQq1z67BVcH0r7s0lPxPOJvk8+t5efA8A1hXfiIzVx35HzlVl/DWnTpro17/
        dTW/IhherhlL85d3DMf6Mt1RKrJglWcuFr5du2WY=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564547986819825.2759067167204; Tue, 30 Jul 2019 21:39:46 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
Subject: MIPS: Ingenic: Fix bugs when detecting X1000's parameters v2.
Date:   Wed, 31 Jul 2019 12:39:02 +0800
Message-Id: <1564547943-27505-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2: Use "set_c0_config7(BIT(4))" to simplify code and add comment.


