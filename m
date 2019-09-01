Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CB4A4A52
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbfIAP6y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:58:54 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:57494 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP6y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:58:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 54D503F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ci7sWiqfD8Nk for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:58:51 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AC47E3F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:51 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:58:51 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 056/120] MIPS: PS2: SIF: Respond to RPC bind end command
Message-ID: <07edaf69eae2bfa41daae262be2d6aac233a2a48.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The IOP responds with a bind end to the main processor's corresponding
command, containing the IOP server memory address to store RPC data.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/sif.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 7d0b120398d1..095d11810499 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -298,6 +298,28 @@ static struct sif_cmd_handler *handler_from_cid(u32 cmd_id)
 	return id < CMD_HANDLER_MAX ? &cmd_handlers[id] : NULL;
 }
 
+static void cmd_rpc_end(const struct sif_cmd_header *header,
+	const void *data, void *arg)
+{
+	const struct sif_rpc_request_end_packet *packet = data;
+	struct sif_rpc_client *client = packet->client;
+
+	switch (packet->client_id) {
+	case SIF_CMD_RPC_CALL:
+		break;
+
+	case SIF_CMD_RPC_BIND:
+		client->server = packet->server;
+		client->server_buffer = packet->server_buffer;
+		break;
+
+	default:
+		BUG();
+	}
+
+	complete_all(&client->done);
+}
+
 static void cmd_rpc_bind(const struct sif_cmd_header *header,
 	const void *data, void *arg)
 {
@@ -406,6 +428,7 @@ static int sif_request_cmds(void)
 	} cmds[] = {
 		{ SIF_CMD_WRITE_SREG, cmd_write_sreg, NULL },
 
+		{ SIF_CMD_RPC_END,    cmd_rpc_end,    NULL },
 		{ SIF_CMD_RPC_BIND,   cmd_rpc_bind,   NULL },
 	};
 	int err = 0;
-- 
2.21.0

